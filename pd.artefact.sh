#!/bin/bash

if [ "$os" == "Visual Studio 2015" ]; then
  del /F /S /Q /A %APPVEYOR_BUILD_FOLDER%\*.pdb
  del /F /S /Q /A %APPVEYOR_BUILD_FOLDER%\*.ilk
fi
