# Install script for directory: /MyData/Research/3-CodeProject/ModernGMT/gmt/share

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share" TYPE DIRECTORY FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/cpt"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/custom"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/dbase"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/localization"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/mgd77"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/mgg"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/spotter"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/x2sys"
    REGEX "/\\.svn$" EXCLUDE REGEX "/cmakelists\\.txt$" EXCLUDE REGEX "[.](cmake|in)$" EXCLUDE)
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/share/VERSION")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/share/tools/cmake_install.cmake")

endif()

