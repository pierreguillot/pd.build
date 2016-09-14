#!/bin/bash

mkdir build
cd build

if [ "$os" = "linux" ] && [ "$plateform" = "x86" ]; then
  cmake .. -DCMAKE_C_FLAGS=-m32
  cmake --build . --config $configuration
elif [ "$os" = "linux" ] && [ "$plateform" = "x64" ]; then
  cmake .. -DCMAKE_C_FLAGS=-m64
  cmake --build . --config $configuration
elif [ "$os" = "osx" ]; then
  cmake ..
  cmake --build . --config $configuration
elif [ "$os" == "Visual Studio 2015" ]; then
  cmake .. -G "Visual Studio 14 2015"
  cmake --build . -- /verbosity:minimal /p:Configuration=%CONFIGURATION%
fi

cd ..
