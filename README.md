# pd.build

The repository offers a set of script to facilitate the creation of [CMake](https://cmake.org/) project to compile [Pure Data](https://puredata.info/) externals.

### Dependencies
* The build system required [CMake](https://cmake.org/) (version minimum 2.8).
* The MacOs and Linux CI and deployment system used is [Travis](https://travis-ci.org/).  
* The Windows CI and deployment system used is [Appveyor](https://ci.appveyor.com/).  

### How to write the CMakeList

* Define CMake minimum version:
`cmake_minimum_required(VERSION 2.8)`

* Include pd.cmake:    
`include(path-to-pd.cmake)`

* Declare the name of the project:   
`project(name-of-my-project)`

* Declare the path to the Pure Data sources (optional):  
`include_directories(path-to-pd-sources)`

* Set the output path for the externals (optional):  
`set_pd_external_path(path-for-the-externals)`

* Adds one or several externals:   
`add_pd_external(EXTERNAL_PROJECT_NAME EXTERNAL_NAME EXTERNAL_SOURCES)`  
  * EXTERNAL_PROJECT_NAME is the name of the project
  * EXTERNAL_NAME is the name of the external
  * EXTERNAL_SOURCES are the source files of the external
