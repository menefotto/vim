cmake_minimum_required(VERSION 3.7)
project(runtime)

#include headers and sources
include_directories(include /usr/local/include)

#include c++17 standard
set(CMAKE_CXX_FLAGS "-std=c++1z -g -Wall -pedantic")
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(libbenchmark STATIC IMPORTED)
set_property(TARGET libbenchmark PROPERTY IMPORTED_LOCATION /usr/local/lib/libbenchmark.a)

add_library(libfmt STATIC IMPORTED)
set_property(TARGET libfmt PROPERTY IMPORTED_LOCATION /usr/local/lib/libfmt.a)
#use clang toolchain
#set(CMAKE_LINKER_FLAGS "-stdlib=libc++ -lc++abi")

#include compilation database for youcompleteme
set(CMAKE_EXPORT_COMPILE_COMMANDS ON) 


#add queue benchmark
add_executable(queue_bench ../tests/queue_bench.cpp)
target_link_libraries(queue_bench pthread libbenchmark)


#add runtime executable
add_executable(runtime ../src/main.cpp)
target_link_libraries(runtime pthread libfmt)
