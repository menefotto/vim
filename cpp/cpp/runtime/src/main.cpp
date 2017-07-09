#include <fmt/printf.h>
#include <exception>
#include <functional>
#include <iostream>
#include "../include/task_pool.hpp"

int main() {
  task_pool<1> t;
  for (auto i = 0; i < 1000; i++) {
    try {
      t.push([&, i] { fmt::print("hello {} \n", i); });
    } catch (const std::exception &e) {
      std::cout << "caught: " << e.what() << "\n";
    }
  }
}
