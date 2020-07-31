# Install script for directory: /MyData/Research/3-CodeProject/ModernGMT/gmt/cmake/dist

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
  
	set (BU_CHMOD_BUNDLE_ITEMS TRUE CACHE INTERNAL
		"make bundle items writable before invoking install_name_tool")
	if (CMAKE_INSTALL_PREFIX MATCHES "_CPack_Packages.+[.]app/Contents/Resources")
		cmake_policy (SET CMP0009 NEW)
		cmake_policy (SET CMP0011 NEW)
		# Workaround incompatible 'file' utilities possibly used in
		# is_file_executable() from GetPrerequisites.cmake:
		set (file_cmd /usr/bin/file)

		# gp_item_default_embedded_path item default_embedded_path_var
		#
		# Return the path that others should refer to the item by when the item
		# is embedded inside a bundle.
		#
		# Override on a per-project basis by providing a project-specific
		# gp_item_default_embedded_path_override function.
		#
		function(gp_item_default_embedded_path_override item default_embedded_path_var)
		  # By default, embed items as set by gp_item_default_embedded_path:
			set(path "${${default_embedded_path_var}}")
			# Embed *.dylib in the lib folder:
			if(item MATCHES "[.]dylib$")
				set(path "@executable_path/../lib")
			endif()
			set(${default_embedded_path_var} "${path}" PARENT_SCOPE)
		endfunction(gp_item_default_embedded_path_override)

		include (BundleUtilities)
		fixup_bundle("${CMAKE_INSTALL_PREFIX}/bin/gmt" "${CMAKE_INSTALL_PREFIX}/lib/gmt/plugins/supplements.so" "")
	endif ()
	
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDocumentationx" OR NOT CMAKE_INSTALL_COMPONENT)
  
	if (CMAKE_INSTALL_PREFIX MATCHES "_CPack_Packages.+[.]app/Contents/Resources")
		execute_process (COMMAND /usr/local/Cellar/cmake/3.14.3/bin/cmake -E rename
			${CMAKE_INSTALL_PREFIX}/share/doc
			${CMAKE_INSTALL_PREFIX}/../../../Documentation)
	endif ()
	
endif()

