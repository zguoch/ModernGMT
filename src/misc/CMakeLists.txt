#
#
# Copyright (c) 1991-2018 by P. Wessel, W. H. F. Smith, R. Scharroo, J. Luis, and F. Wobbe
# See LICENSE.TXT file for copying and redistribution conditions.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; version 3 or any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# Contact info: gmt.soest.hawaii.edu
#-------------------------------------------------------------------------------
#
# To modify the cmake process: Edit your cmake/ConfigUser.cmake file
#

# source files
set (SUPPL_PROGS_SRCS dimfilter.c grdppa.c)

# lib sources
set (LIB_SRCS ${SUPPL_PROGS_SRCS})

# example files
set (SUPPL_EXAMPLE_FILES README.misc)
set (SUPPL_EXAMPLE_PROGS dim.template.sh)

# create build targets
string (REPLACE ".c" "" _gmt_modules "${SUPPL_PROGS_SRCS}")
install_module_symlink (${_gmt_modules})

# install example data
if (UNIX)
	install (FILES ${SUPPL_EXAMPLE_FILES}
		DESTINATION ${GMT_DOCDIR}/supplements/misc
		COMPONENT Documentation)
	install (PROGRAMS ${SUPPL_EXAMPLE_PROGS}
		DESTINATION ${GMT_DOCDIR}/supplements/misc
		COMPONENT Documentation)
endif (UNIX)

# vim: textwidth=78 noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
