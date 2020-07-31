# Install script for directory: /MyData/Research/3-CodeProject/ModernGMT/gmt/doc_modern/rst

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/html" TYPE DIRECTORY OPTIONAL FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/html/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/pdf" TYPE FILE OPTIONAL FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/latex/GMT_API.pdf"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/latex/GMT_Docs.pdf"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/latex/GMT_Tutorial.pdf"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/latex/GMT_Manpages.pdf"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man1" TYPE DIRECTORY FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/man/" FILES_MATCHING REGEX "/[^/]*\\.1\\.gz$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man3" TYPE DIRECTORY FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/man/" FILES_MATCHING REGEX "/[^/]*\\.3\\.gz$")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/man/man5" TYPE DIRECTORY FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/man/" FILES_MATCHING REGEX "/[^/]*\\.5\\.gz$")
endif()

