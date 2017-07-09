#ifndef SAFE_QUEUE
#define SAFE_QUEUE

#include <atomic>
#include <condition_variable>
#include <deque>
#include <iostream>
#include <mutex>

template <class T>
class safe_queue {
 public:
  safe_queue() = default;
  ~safe_queue() = default;

  safe_queue(safe_queue&&) = default;
  safe_queue& operator=(safe_queue&&) = default;
  safe_queue(const safe_queue&) = delete;
  safe_queue& operator=(const safe_queue&) = delete;

  void done() {
    _done = true;
    _ready.notify_all();
  }

  template <class F>
  bool try_push(F&& value) {
    {
      std::unique_lock<std::mutex> lck(_mtx, std::try_to_lock);
      if (!lck) {
        return false;
      }

      _q.push_front(std::forward<F>(value));
    }

    _ready.notify_one();
    return true;
  }

  template <class F>
  bool push(F&& value) {
    {
      std::unique_lock<std::mutex> lck(_mtx);
      _q.push_front(std::forward<F>(value));
    }

    _ready.notify_one();
    return true;
  }

  bool try_pop(std::function<void()>& x) {
    std::unique_lock<std::mutex> lck(_mtx, std::try_to_lock);
    if (!lck || _q.empty()) {
      return false;
    }

    x = std::move(_q.back());
    _q.pop_back();

    return true;
  }

  bool pop(std::function<void()>& x) {
    std::unique_lock<std::mutex> lck(_mtx);
    while (_q.empty() && !_done) {
      _ready.wait(lck);
    }

    if (_q.empty()) {
      return false;
    }

    x = std::move(_q.back());
    _q.pop_back();

    return true;
  }

 private:
  std::mutex _mtx;
  std::deque<T> _q;
  std::atomic<bool> _done{false};
  std::condition_variable _ready;
};

#endif
