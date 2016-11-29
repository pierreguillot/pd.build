#!/bin/bash

zip -r $PACKAGE.zip $*

PACKAGE_VALUE=$TRAVIS_COMMIT
if [ $TRAVIS_TAG ]; then
  PACKAGE_VALUE=$TRAVIS_TAG
fi

if [[ "$TRAVIS" == "true" ]]; then
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
if [[ "$PLATFORM" == "linux32" ]]; then
  mv $PACKAGE.zip $PACKAGE-$TRAVIS_COMMIT-"("Linux-i386-32")""("Sources")"-externals.zip
elif [[ "$PLATFORM" == "linux64" ]]; then
  mv $PACKAGE.zip $PACKAGE-$TRAVIS_COMMIT-"("Linux-amd64-64")""("Sources")"-externals.zip
fi
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  mv $PACKAGE.zip $PACKAGE-$TRAVIS_COMMIT-"("Darwin-i386-32")""("Darwin-x86_64-32")""("Sources")"-externals.zip
fi
elif [["$APPVEYOR" == "True"]]; then
  echo "nothing to do for appveyor..."
fi

ls
