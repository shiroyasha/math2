#!/usr/bin/env bash

sudo apt-get install libgtest-dev cmake

cd /usr/src/gtest

sudo cmake CMakeLists.txt
sudo make

sudo cp *.a /usr/lib
