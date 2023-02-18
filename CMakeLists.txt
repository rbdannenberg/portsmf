# portsmf - Score Data Structure (Allegro) with 
#           Standard MIDI File and Allegro readers/writers
# Roger B. Dannenberg (and others)
# Sep 2009 - 2023

# This is a small, mostly self-contained library, so my recommendation is
# to incorporate files into any project that needs them. However, there
# are also some utility programs supported, so we need some support to
# build them. Previous to 2023, there were Makefiles and Visual Studio
# and Xcode project files as well as configure for Audacity. This
# CMakeLists.txt is intended to replace all of this, but even if anyone
# bothers, it will take time to integrate workflows, so changes ar
# welcome.  As of Feb 2023, this CMakeLists.txt is only tested on macOS.
# It is wired to build a static library named portsmf-static.a to
# circumvent macOS aggressive bias toward dynamic libraries (Xcode
# rewrites xxx.a to xxx.dylib behind your back).


cmake_minimum_required(VERSION 3.21)

project(portsmf VERSION "${VERSION}" 
                DESCRIPTION "Music event-list with Std MIDI File compatibility")

set(CMAKE_OSX_DEPLOYMENT_TARGET 10.9 CACHE STRING
             "make for this OS version or higher")

# Build Types
# credit: http://cliutils.gitlab.io/modern-cmake/chapters/features.html
set(DEFAULT_BUILD_TYPE "Release")
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS 
      "Setting build type to '${DEFAULT_BUILD_TYPE}' as none was specified.")
  set(CMAKE_BUILD_TYPE "${DEFAULT_BUILD_TYPE}" CACHE
      STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS
               "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

set(SMF_SRC allegro.cpp allegro.h
            allegrosmfwr.cpp allegrosmfrd.cpp algsmfrd_internal.h
            allegrord.cpp allegrowr.cpp algrd_internal.h
            allegrowr.cpp
            allegroserial.cpp
            mfmidi.cpp mfmidi.h
            strparse.cpp strparse.h
            trace.h)

add_library(portsmf-static ${SMF_SRC})
set_target_properties(portsmf-static PROPERTIES OUTPUT_NAME "portmidi-static")

add_subdirectory(apps)
add_subdirectory(portsmf_test)


