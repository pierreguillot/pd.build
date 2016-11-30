#!/bin/bash

if [[ "$TRAVIS" == "true" ]]; then
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then
echo "not supported yet"
elif [[ "$PLATFORM" == "linux64" ]]; then
echo "not supported yet"
fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  curl -o pd-0.47-1.mac.tar.gz 'http://msp.ucsd.edu/Software/pd-0.47-1.mac.tar.gz'
  tar -xvf pd-0.47-1.mac.tar.gz
  ./Pd-0.47-1.app/Contents/Resources/bin/pd  -stderr -open $1
fi
fi
