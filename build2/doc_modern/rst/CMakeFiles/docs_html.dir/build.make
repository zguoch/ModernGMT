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

# Utility rule file for docs_html.

# Include the progress variables for this target.
include doc_modern/rst/CMakeFiles/docs_html.dir/progress.make

doc_modern/rst/CMakeFiles/docs_html:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/MyData/Research/3-CodeProject/ModernGMT/gmt/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building HTML documentation..."
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst && /Users/zguo/.pyenv/shims/sphinx-build -q -b html -c /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst -d /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/_doctrees -w /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/html.log /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/_source /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/html

docs_html: doc_modern/rst/CMakeFiles/docs_html
docs_html: doc_modern/rst/CMakeFiles/docs_html.dir/build.make

.PHONY : docs_html

# Rule to build all files generated by this target.
doc_modern/rst/CMakeFiles/docs_html.dir/build: docs_html

.PHONY : doc_modern/rst/CMakeFiles/docs_html.dir/build

doc_modern/rst/CMakeFiles/docs_html.dir/clean:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst && $(CMAKE_COMMAND) -P CMakeFiles/docs_html.dir/cmake_clean.cmake
.PHONY : doc_modern/rst/CMakeFiles/docs_html.dir/clean

doc_modern/rst/CMakeFiles/docs_html.dir/depend:
	cd /MyData/Research/3-CodeProject/ModernGMT/gmt/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /MyData/Research/3-CodeProject/ModernGMT/gmt /MyData/Research/3-CodeProject/ModernGMT/gmt/doc_modern/rst /MyData/Research/3-CodeProject/ModernGMT/gmt/build /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst /MyData/Research/3-CodeProject/ModernGMT/gmt/build/doc_modern/rst/CMakeFiles/docs_html.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc_modern/rst/CMakeFiles/docs_html.dir/depend

