#include <benchmark/benchmark_api.h>
#include <functional>
#include <iostream>
#include "safe_queue.hpp"

long find_prime_number(int n) {
  int count = 0;
  long a = 2;
  while (count < n) {
    long b = 2;
    int prime = 1;  // to check if found a prime
    while (b * b <= a) {
      if (a % b == 0) {
        prime = 0;
        break;
      }
      b++;
    }
    if (prime > 0) {
      count++;
    }
    a++;
  }
  return (--a);
}

void BM_Q_pop(benchmark::State& state) {
  safe_queue<std::function<void()>> q;
  for (auto i = 0; i < 100000000; i++) {
    benchmark::DoNotOptimize(q.push([] { find_prime_number(1000); }));
  }
  while (state.KeepRunning()) {
    std::function<void()> f;
    q.pop(f);
  }
}

BENCHMARK(BM_Q_pop)->Arg(10000000)->Unit(benchmark::kNanosecond);

void BM_Q_push(benchmark::State& state) {
  safe_queue<std::function<void()>> q;
  while (state.KeepRunning()) {
    benchmark::DoNotOptimize(q.push([] { find_prime_number(1000); }));
  }
}

BENCHMARK(BM_Q_push)->Arg(10000000)->Unit(benchmark::kNanosecond);

BENCHMARK_MAIN()
