#!/bin/bash

if ["$CI_OS" == "linux32"];
then
  sudo apt-get install -y gcc-multilib
  sudo apt-get install -y libc6-dev-i386
elseif ["$CI_OS" == "win32"];
then
  git submodule update --init --recursive
elseif ["$CI_OS" == "win64"];
then
  git submodule update --init --recursive
fi
