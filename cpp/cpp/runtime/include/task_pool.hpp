#ifndef TASK_POOL
#define TASK_POOL

#include <algorithm>
#include <atomic>
#include <exception>
#include <functional>
#include <iostream>
#include <thread>
#include <vector>
#include "safe_queue.hpp"

template <std::size_t N = 4>
class task_pool {
 public:
  task_pool() : _qs(N) {
    static_assert(N > 1, "N should be at least 2");
    // prefer static check over runtime check such as throwing from
    // constructor..., static_assert and type_traits library are your
    // friends...
    for (auto i = 0; i < N; i++) {
      _threads.emplace_back([&, i] { run(i); });
    }
  }

  task_pool(const task_pool &) = delete;
  task_pool &operator=(const task_pool &) = delete;
  task_pool(const task_pool &&) = delete;
  task_pool &operator=(const task_pool &&) = delete;

  ~task_pool() {
    for (auto &q : _qs) {
      q.done();
    }
    for (auto &e : _threads) {
      e.join();
    }
  }

  void run(unsigned int i) {
    while (true) {
      std::function<void()> f;
      // work stealing loop
      for (auto j = 0; j < N; j++) {
        if (_qs[(i + j) % N].try_pop(f)) {
          break;
        }
      }

      // if nothing got popped we sit on our queue
      if (!f && !_qs[i].pop(f)) {
        break;
      }

      f();
    }
  }

  template <typename F>
  void push(F &&f) {
    auto i = _index++;

    // schedule the taks in a semi-random queue
    for (auto j = 0; j < N * 11; j++) {
      if (_qs[(i + j) % N].try_push(std::forward<F>(f))) {
        return;
      }
    }

    // if not scheduled yet push on our queue
    _qs[i % N].push(std::forward<F>(f));
  }

 private:
  std::atomic<unsigned> _index{0};
  std::vector<safe_queue<std::function<void()>>> _qs;
  std::vector<std::thread> _threads;
};

#endif
