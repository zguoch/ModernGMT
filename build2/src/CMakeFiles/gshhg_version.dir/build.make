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

# Include any dependencies generated for this target.
include src/CMakeFiles/gshhg_version.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/gshhg_version.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/gshhg_version.dir/flags.make

src/CMakeFiles/gshhg_version.dir/gshhg_version.c.o: src/CMakeFiles/gshhg_version.dir/flags.make
src/CMakeFiles/gshhg_version.dir/gshhg_version.c.o: ../src/gshhg_version.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/MyData/Research/3-CodeProject/ModernGMT/gmt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/CMakeFiles/gshhg_version.dir/gshhg_version.c.o"
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/gshhg_version.dir/gshhg_version.c.o   -c /MyData/Research/3-CodeProject/ModernGMT/gmt/src/gshhg_version.c

src/CMakeFiles/gshhg_version.dir/gshhg_version.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/gshhg_version.dir/gshhg_version.c.i"
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /MyData/Research/3-CodeProject/ModernGMT/gmt/src/gshhg_version.c > CMakeFiles/gshhg_version.dir/gshhg_version.c.i

src/CMakeFiles/gshhg_version.dir/gshhg_version.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/gshhg_version.dir/gshhg_version.c.s"
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /MyData/Research/3-CodeProject/ModernGMT/gmt/src/gshhg_version.c -o CMakeFiles/gshhg_version.dir/gshhg_version.c.s

# Object files for target gshhg_version
gshhg_version_OBJECTS = \
"CMakeFiles/gshhg_version.dir/gshhg_version.c.o"

# External object files for target gshhg_version
gshhg_version_EXTERNAL_OBJECTS =

src/gshhg_version: src/CMakeFiles/gshhg_version.dir/gshhg_version.c.o
src/gshhg_version: src/CMakeFiles/gshhg_version.dir/build.make
src/gshhg_version: /usr/local/Cellar/netcdf/4.6.3_1/lib/libnetcdf.dylib
src/gshhg_version: src/CMakeFiles/gshhg_version.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/MyData/Research/3-CodeProject/ModernGMT/gmt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable gshhg_version"
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gshhg_version.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/gshhg_version.dir/build: src/gshhg_version

.PHONY : src/CMakeFiles/gshhg_version.dir/build

src/CMakeFiles/gshhg_version.dir/clean:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src && $(CMAKE_COMMAND) -P CMakeFiles/gshhg_version.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/gshhg_version.dir/clean

src/CMakeFiles/gshhg_version.dir/depend:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /MyData/Research/3-CodeProject/ModernGMT/gmt /MyData/Research/3-CodeProject/ModernGMT/gmt/src /MyData/Research/3-CodeProject/ModernGMT/gmt/build /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src /MyData/Research/3-CodeProject/ModernGMT/gmt/build/src/CMakeFiles/gshhg_version.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/gshhg_version.dir/depend

