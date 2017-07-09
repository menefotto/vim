#!/bin/bash

run-clang-tidy-4.0.py -checks='-*,clang-analyzer-*,modernize-*,performance-*,readability-*,cert-*,cppcoreguidelines-*' -header-filter=./include -p . $1
