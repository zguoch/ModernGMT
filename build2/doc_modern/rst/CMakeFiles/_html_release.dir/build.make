# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.14.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /MyData/Research/3-CodeProject/ModernGMT/gmt

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /MyData/Research/3-CodeProject/ModernGMT/gmt/build

# Utility rule file for _html_release.

# Include the progress variables for this target.
include doc_modern/rst/CMakeFiles/_html_release.dir/progress.make

doc_modern/rst/CMakeFiles/_html_release:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst && /usr/local/Cellar/cmake/3.14.3/bin/cmake -E copy_directory /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/html/ /MyData/Research/3-CodeProject/ModernGMT/gmt/build/gmt-6.0.0/doc_release/html

_html_release: doc_modern/rst/CMakeFiles/_html_release
_html_release: doc_modern/rst/CMakeFiles/_html_release.dir/build.make

.PHONY : _html_release

# Rule to build all files generated by this target.
doc_modern/rst/CMakeFiles/_html_release.dir/build: _html_release

.PHONY : doc_modern/rst/CMakeFiles/_html_release.dir/build

doc_modern/rst/CMakeFiles/_html_release.dir/clean:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst && $(CMAKE_COMMAND) -P CMakeFiles/_html_release.dir/cmake_clean.cmake
.PHONY : doc_modern/rst/CMakeFiles/_html_release.dir/clean

doc_modern/rst/CMakeFiles/_html_release.dir/depend:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /MyData/Research/3-CodeProject/ModernGMT/gmt /MyData/Research/3-CodeProject/ModernGMT/gmt/doc_modern/rst /MyData/Research/3-CodeProject/ModernGMT/gmt/build /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/CMakeFiles/_html_release.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc_modern/rst/CMakeFiles/_html_release.dir/depend

