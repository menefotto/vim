#ifndef UTILS
#define UTILS

#include <experimental/string_view>
#include <fstream>
#include <iostream>
#include <regex>
#include <string>

constexpr std::size_t core_count() {
  std::size_t N = 4;
  //  std::string input;
  //  std::smatch match;
  //  std::regex regx("processor");
  //  std::ifstream cpuinfo("/proc/cpuinfo");

  // std::cout << cpuinfo.tellg() << "\n";
  // cpuinfo.open("/proc/cpuinfo");
  //  std::experimental::string_view sv(cpuinfo);
  // if (std::regex_match(sv, match, regx)) {
  //  N = match.size();
  //}
  // cpuinfo.close();

  return N;
}

#endif
