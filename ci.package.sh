#!/bin/bash

cp LICENSE PACKAGE/license.txt
cp README.md PACKAGE/readme.txt
cp -r src/ PACKAGE/sources/

PACKAGE_VALUE=$TRAVIS_COMMIT
if [ $TRAVIS_TAG ]; then
  PACKAGE_VALUE=$TRAVIS_TAG
fi

if [[ "$TRAVIS" == "true" ]]; then
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then
  zip -r $PACKAGE-$PACKAGE_VALUE-"("Linux-i386-32")""("Sources")"-externals.zip $PACKAGE
elif [[ "$PLATFORM" == "linux64" ]]; then
  zip -r $PACKAGE-$PACKAGE_VALUE-"("Linux-amd64-64")""("Sources")"-externals.zip $PACKAGE
fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  zip -r $PACKAGE-$PACKAGE_VALUE-"("Darwin-i386-32")""("Darwin-x86_64-32")""("Sources")"-externals.zip $PACKAGE
fi
elif [["$APPVEYOR" == "True"]]; then

fi

ls
