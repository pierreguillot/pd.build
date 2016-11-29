#!/bin/bash

if [[ "$TRAVIS" == "true" ]]; then
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then
echo "Build on Travis for linux 32"
sudo apt-get install -y gcc-multilib
sudo apt-get install -y libc6-dev-i386
elif [[ "$PLATFORM" == "linux64" ]]; then
echo "Build on Travis for linux 64"
fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
echo "Build on Travis for mac osx universal"
fi
elif [["$APPVEYOR" == "True"]]; then
echo "Build on Appveyor for windows 32"
fi
