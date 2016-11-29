#!/bin/bash

if [[ "$TRAVIS" == "true" ]];

if [[ "$TRAVIS_OS_NAME" == "linux" ]];
if [[ "$PLATFORM" == "linux32" ]];
mkdir build
cd build
cmake .. -DCMAKE_C_FLAGS=-m32
cmake --build . --config Release
cd ..
fi

if [[ "$PLATFORM" == "linux64" ]];
mkdir build
cd build
cmake .. -DCMAKE_C_FLAGS=-m64
cmake --build . --config Release
cd ..
fi
fi

if [[ "$TRAVIS_OS_NAME" == "osx" ]];
mkdir build
cd build
cmake .. "-DCMAKE_OSX_ARCHITECTURES=i386;x86_64"
cmake --build . --config Release
cd ..
fi

fi
