#!/bin/bash

if [[ "$TRAVIS" == "true" ]]; then
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then

elif [[ "$PLATFORM" == "linux64" ]]; then

fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
curl -o pd-0.47-1.mac.tar.gz 'http://msp.ucsd.edu/Software/pd-0.47-1.mac.tar.gz'
tar -xvf Pd-0.47-1.tar.gz
./*.app/Contents/Resources/bin/pd  -stderr -open $1
fi
fi
