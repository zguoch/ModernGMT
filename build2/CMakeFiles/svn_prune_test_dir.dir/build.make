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

# Utility rule file for svn_prune_test_dir.

# Include the progress variables for this target.
include CMakeFiles/svn_prune_test_dir.dir/progress.make

CMakeFiles/svn_prune_test_dir:
	/usr/local/Cellar/cmake/3.14.3/bin/cmake -E remove_directory /MyData/Research/3-CodeProject/ModernGMT/gmt/build/gmt-6.0.0/test

svn_prune_test_dir: CMakeFiles/svn_prune_test_dir
svn_prune_test_dir: CMakeFiles/svn_prune_test_dir.dir/build.make

.PHONY : svn_prune_test_dir

# Rule to build all files generated by this target.
CMakeFiles/svn_prune_test_dir.dir/build: svn_prune_test_dir

.PHONY : CMakeFiles/svn_prune_test_dir.dir/build

CMakeFiles/svn_prune_test_dir.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/svn_prune_test_dir.dir/cmake_clean.cmake
.PHONY : CMakeFiles/svn_prune_test_dir.dir/clean

CMakeFiles/svn_prune_test_dir.dir/depend:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /MyData/Research/3-CodeProject/ModernGMT/gmt /MyData/Research/3-CodeProject/ModernGMT/gmt /MyData/Research/3-CodeProject/ModernGMT/gmt/build /MyData/Research/3-CodeProject/ModernGMT/gmt/build /MyData/Research/3-CodeProject/ModernGMT/gmt/build/CMakeFiles/svn_prune_test_dir.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/svn_prune_test_dir.dir/depend

