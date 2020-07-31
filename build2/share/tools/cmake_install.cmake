# Install script for directory: /MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tools" TYPE PROGRAM FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_functions.sh"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_aliases.csh"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_links.sh"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_prepmex.sh"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_make_custom_code.sh"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_uninstall.sh"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/ncdeflate"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/share/tools/gmt5syntax"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/tools" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/share/tools/gmt_completion.bash")
endif()

