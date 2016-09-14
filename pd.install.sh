#!/bin/bash

if [ "$os" = "linux" ] && [ "$plateform" = "x86" ]; then
  sudo apt-get install -y gcc-multilib
  sudo apt-get install -y libc6-dev-i386
elif [ "$os" == "Visual Studio 2015" ]; then
  git submodule update --init --recursive
fi
