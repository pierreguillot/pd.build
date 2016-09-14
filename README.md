# pd.build

The repository offers a set of script to facilitate the creation of [CMake](https://cmake.org/) project to compile [Pure Data](https://puredata.info/) externals.

### Dependencies
* The build system required [CMake](https://cmake.org/) (version minimum 2.8).

### How to write the CMakeList

1. Define your standard CMake header (for example):
```cmake
cmake_minimum_required(VERSION 2.8)
set(CMAKE_SUPPRESS_REGENERATION true)
set(CMAKE_MACOSX_RPATH Off)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.4)
set(CMAKE_OSX_ARCHITECTURES "i386;x86_64")
```

2. Include pd.cmake (for example):    
```cmake
include(pd.build/pd.cmake)
```

3. Declare the name of the project:   
```cmake
project(name-of-my-project)
```

4. Define the path to the Pure Data sources:  
```cmake
set_pd_sources(path-to-pd-sources)
```

5. Set the output path for the externals:  
```cmake
set_pd_external_path(path-for-the-externals)
```

6. Adds one or several externals:   
```cmake
add_pd_external(EXTERNAL_PROJECT_NAME EXTERNAL_NAME EXTERNAL_SOURCES)
```
  * EXTERNAL_PROJECT_NAME is the name of the project
  * EXTERNAL_NAME is the name of the external
  * EXTERNAL_SOURCES are the source files of the external
