#!/bin/bash

if [[ "$TRAVIS" == "true" ]];
echo "Build on Travis"

if [[ "$TRAVIS_OS_NAME" == "linux" ]];
if [[ "$PLATFORM" == "linux32" ]];
sudo apt-get install -y gcc-multilib
sudo apt-get install -y libc6-dev-i386
fi

if [[ "$PLATFORM" == "linux64" ]];
echo "Build on linux 64"
fi
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]];
echo "Build on osx universal"
fi

fi
