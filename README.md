# pd.build

The repository offers a set of script to facilitate the creation of [CMake](https://cmake.org/) projects to compile [Pure Data](https://puredata.info/) externals. CMake is a free, open-source and cross-platform system that allows to generate makefiles and projects for many OS and build systems and/or IDEs (Unix makefile, XCode, Visual Studio, Code::Blocks, etc.). So the goal of the pd.build is to offer a system that allows to easily and quickly create projects for developing and compiling Pd externals on the environment of your choice.

***

1. [Pre-required]()
2. [Configuration]()
3. [Generation]()
4. [Continuous Integration]()
  1. [Travis]()
  2. [Appveyor]()
6. [Packaging & Distribution]()
7. Examples
8. Other project

***

## Pre-required

To compile Pd externals using *pd.build*, you need [CMake](https://cmake.org/) (minimum version 2.8) and a build system or an IDE (like Unix makefile, XCode, Visual Studio, Code::Blocks, etc.). You also need the Pure Data sources, that are generally included within your Pure Data distribution and [pd.build](https://github.com/pierreguillot/pd.build/archive/master.zip). If you use [Git](https://git-scm.com/) to manage your project, it is recommend to include pd.build as a submodule `git submodule add https://github.com/pierreguillot/pd.build`. The Pd sources can also be included as a submodule using the [Git repository](https://github.com/pure-data/pure-data).

## Configuration

The configuration of the CMakeList with pd.build is pretty straight forward but depends on how you manage your project (folder, sources, dependencies, etc.). Here is an example that demonstrate the basic usage of the pd.build system:

```cmake
# Define your standard CMake header (for example):
cmake_minimum_required(VERSION 2.8)

set(CMAKE_SUPPRESS_REGENERATION true)
set(CMAKE_MACOSX_RPATH Off)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.4)
set(CMAKE_OSX_ARCHITECTURES "i386;x86_64")

# Include pd.cmake (1):  
include(${project_source_dir}/pd.build/pd.cmake)

# Declare the name of the project:   
project(my_objects)

# Define the path to the Pure Data sources (2):
set_pd_sources(${project_source_dir}/pure-data/src)

# Set the output path for the externals (3):  
set_pd_external_path(${project_source_dir}/binaries/)

# Add one or several externals (4):   
add_pd_external(my_object1_project my_object1_name ${project_source_dir}/sources/my_object1.c)

add_pd_external(my_object2_project my_object2_name ${project_source_dir}/sources/my_object2.c)
```

Further information:  
1. The path *pd.cmake* depends on where you installed *pd.build*, here we assume that *pd.build* is localized at the root directory of you project.  
2. The sources of Pure Data are not directly included in the *pd.build* because perhaps someone would like to use a specific version of Pure Data (like Pd-extended). It is possible that a later version directly include the latest Pd sources by default and use this function to override the path if needed.   
3. Here the externals are installed in the *binaries* subfolder but you can use the function to use the folder of your choice.  
4. The function adds a new subproject to the main project. This subproject matches to a new external allowing to compile only one object without compiling all the others. The first argument is the name of the subproject, the second argument is the name of the external and the third argument are the sources. If you use more than one file, you should use the CMake file system and quotes as demonstrated below:

```cmake
file(GLOB my_object3_sources ${project_source_dir}/sources/my_object3.c ${project_source_dir}/sources/my_object3_other.h ${project_source_dir}/sources/my_object3_other.c)
add_pd_external(my_object3_project my_object3_name "${my_object3_sources}")
```

## Compilation

The generation of the build system or the IDE project is similar to any CMake project. The basic usage follows these steps from the project folder (where *CMakeList* is localized):

```cmake
# Create a subfolder (generally called build)
mkdir build
# Move to this folder
cd build
# Generate a project for the default platform
cmake ..
# Or display the available platforms and generate the project for the platform of your choice
cmake --help (optional)
cmake .. -G "Xcode" (example)
cmake .. -G "Unix Makefiles" (example)
cmake .. -G "Visual Studio 14 2015" (example)
# Then use your IDE or use CMake to compile
cmake --build .
```

## Continuous Integration

The Continuous Integration (CI)

### Travis
