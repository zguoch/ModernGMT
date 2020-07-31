# Install script for directory: /MyData/Research/3-CodeProject/ModernGMT/gmt/doc_modern

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/copying" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/COPYING.LESSERv3")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/copying" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/LICENSE.TXT"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/COPYINGv3"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc" TYPE DIRECTORY FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/doc_modern/examples" USE_SOURCE_PERMISSIONS REGEX "/[^/]*\\.bat$" EXCLUDE REGEX "/\\.svn$" EXCLUDE REGEX "/cmakelists\\.txt$" EXCLUDE REGEX "[.](cmake|in|ps)$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/fig/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/scripts/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/examples/cmake_install.cmake")

endif()

