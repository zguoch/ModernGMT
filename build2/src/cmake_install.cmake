# Install script for directory: /MyData/Research/3-CodeProject/ModernGMT/gmt/src

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins" TYPE MODULE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/plugins/supplements.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libgmt.6.dylib" "/usr/local/lib/libgmt.6.dylib"
      -change "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.6.dylib" "/usr/local/lib/libpostscriptlight.6.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libgmt.6.0.0.dylib"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libgmt.6.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.6.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.6.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND "/usr/bin/install_name_tool"
        -id "/usr/local/lib/libgmt.6.dylib"
        -change "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.6.dylib" "/usr/local/lib/libpostscriptlight.6.dylib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -delete_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
        "${file}")
      execute_process(COMMAND /usr/bin/install_name_tool
        -add_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libgmt.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.dylib")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -id "/usr/local/lib/libgmt.6.dylib"
      -change "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.6.dylib" "/usr/local/lib/libpostscriptlight.6.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.dylib")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libgmt.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.6.0.0.dylib"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.6.dylib"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpostscriptlight.6.0.0.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpostscriptlight.6.dylib"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      execute_process(COMMAND "/usr/bin/install_name_tool"
        -id "/usr/local/lib/libpostscriptlight.6.dylib"
        "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "${file}")
      endif()
    endif()
  endforeach()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.dylib")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpostscriptlight.dylib" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpostscriptlight.dylib")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -id "/usr/local/lib/libpostscriptlight.6.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpostscriptlight.dylib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -x "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpostscriptlight.dylib")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/gmt")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt")
    execute_process(COMMAND "/usr/bin/install_name_tool"
      -change "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libgmt.6.dylib" "/usr/local/lib/libgmt.6.dylib"
      -change "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/libpostscriptlight.6.dylib" "/usr/local/lib/libpostscriptlight.6.dylib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/zguo/.pyenv/versions/anaconda3-5.0.1/lib"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/strip" -u -r "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/blockmean)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/blockmean)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/blockmedian)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/blockmedian)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/blockmode)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/blockmode)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/docs)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/docs)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/filter1d)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/filter1d)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grd2kml)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grd2kml)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/fitcircle)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/fitcircle)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt2kml)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt2kml)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtconvert)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtconvert)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtlogo)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtlogo)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtmath)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtmath)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtselect)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtselect)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtsimplify)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtsimplify)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtspatial)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtspatial)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtconnect)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtconnect)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtregress)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtregress)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtvector)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtvector)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtwhich)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtwhich)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grd2cpt)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grd2cpt)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grd2xyz)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grd2xyz)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdblend)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdblend)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdclip)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdclip)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdcut)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdcut)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdedit)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdedit)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdfft)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdfft)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdfill)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdfill)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdfilter)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdfilter)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdgradient)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdgradient)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdhisteq)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdhisteq)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdinfo)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdinfo)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdlandmask)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdlandmask)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdmask)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdmask)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdmath)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdmath)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdpaste)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdpaste)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdproject)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdproject)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdsample)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdsample)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdconvert)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdconvert)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdtrack)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdtrack)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/movie)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/movie)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdtrend)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdtrend)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdvolume)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdvolume)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/greenspline)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/greenspline)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/kml2gmt)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/kml2gmt)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/makecpt)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/makecpt)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mapproject)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mapproject)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtinfo)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtinfo)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/nearneighbor)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/nearneighbor)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/project)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/project)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psconvert)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psconvert)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sample1d)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sample1d)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spectrum1d)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/spectrum1d)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sph2grd)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sph2grd)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sphdistance)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sphdistance)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sphinterpolate)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sphinterpolate)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sphtriangulate)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sphtriangulate)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/splitxyz)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/splitxyz)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/surface)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/surface)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/trend1d)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/trend1d)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/trend2d)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/trend2d)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/triangulate)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/triangulate)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/xyz2grd)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/xyz2grd)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtdefaults)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtdefaults)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtget)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtget)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtset)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtset)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdcontour)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdcontour)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdimage)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdimage)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdvector)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdvector)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdview)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdview)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psbasemap)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psbasemap)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psclip)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psclip)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pscoast)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pscoast)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pscontour)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pscontour)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pshistogram)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pshistogram)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psimage)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psimage)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psmask)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psmask)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psrose)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psrose)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psscale)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psscale)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pssolar)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pssolar)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psternary)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psternary)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pstext)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pstext)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pswiggle)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pswiggle)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psxy)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psxy)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psxyz)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/psxyz)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pslegend)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/pslegend)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/minmax)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/minmax)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt2rgb)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmt2rgb)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtstitch)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtstitch)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtdp)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/gmtdp)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdreformat)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/grdreformat)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ps2raster)
				execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E create_symlink
					gmt
					$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/ps2raster)
				
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_resources.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/declspec.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/postscriptlight.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/common_math.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/common_string.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_common.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_constants.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_contour.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_dcw.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_decorate.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_defaults.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_error.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_error_codes.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_fft.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_gdalread.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_grd.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_grdio.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_hash.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_io.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_macros.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_memory.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_modern.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_nan.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_notposix.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_plot.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_private.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_project.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_prototypes.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_psl.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_shore.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_symbol.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_synopsis.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_texture.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_time.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_types.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_dev.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_customio.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_hidden.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_mb.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_core_module.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_supplements_module.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/compat/qsort.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/compat" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/compat/qsort.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/gshhg" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gshhg/gshhg.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gshhg/gmt_gshhg.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/meca" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/meca/meca.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/meca/utilmeca.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/mgd77" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/cm4_functions.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_e77.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_rls_coeffs.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77snifferdefaults.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_functions.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77defaults.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_IGF_coeffs.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_init.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77magref.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_codes.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77_recalc.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/mgd77/mgd77sniffer.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/potential" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/potential/okbfuns.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/spotter" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/spotter/spotter.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt/x2sys" TYPE FILE FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/x2sys/x2sys.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/gmt" TYPE FILE FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/config.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/gmt_config.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/gmt_dimensions.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/gmt_version.h"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/psl_config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/isogmt"
    "/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/gmt-config"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "gmtswitch" FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmtswitch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xRuntimex" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "gmt_shell_functions.sh" FILES "/MyData/Research/3-CodeProject/ModernGMT/gmt/src/gmt_shell_functions.sh")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/gshhg/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/img/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/meca/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/mgd77/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/misc/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/potential/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/segy/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/spotter/cmake_install.cmake")
  include("/MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/x2sys/cmake_install.cmake")

endif()

