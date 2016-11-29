#!/bin/bash

if [[ "$TRAVIS" == "true" ]]; then
mkdir build
cd build

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then
cmake .. -DCMAKE_C_FLAGS=-m32
elif [[ "$PLATFORM" == "linux64" ]]; then
cmake .. -DCMAKE_C_FLAGS=-m64
fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
cmake .. "-DCMAKE_OSX_ARCHITECTURES=i386;x86_64"
fi
cmake --build . --config Release
cd ..
elif [["$APPVEYOR" == "True"]]; then
mkdir build
cd build
cmake .. -G "Visual Studio 14 2015"
cmake --build . -- /verbosity:minimal /p:Configuration=Release
cd ..
fi
