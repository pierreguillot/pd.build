#!/bin/bash

if [[ "$TRAVIS" == "true" ]]; then
echo "Build on Travis"

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then
sudo apt-get install -y gcc-multilib
sudo apt-get install -y libc6-dev-i386
elif [[ "$PLATFORM" == "linux64" ]]; then
echo "Build on linux 64"
fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
echo "Build on osx universal"
fi
fi
