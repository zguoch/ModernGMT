/*
 *
 *	Copyright (c) 2009-2018 by P. Wessel and R. Scharroo
 *
 *	This program is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU Lesser General Public License as published by
 *	the Free Software Foundation; version 3 or any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU Lesser General Public License for more details.
 *
 * Contact info: gmt.soest.hawaii.edu
 *--------------------------------------------------------------------
 *
 * This include file contains ifdefs that tell us if this system has
 * some of the several functions that are not part of POSIX but are
 * often distributed anyway as part of ANSI C.  The set of defines
 * below is automatically assigned by CMake and determines if the
 * required functions are present or not.  These macros are then used
 * to choose between a function prototype (if found), an alternative
 * PSL function, or simply a macro.  The purpose is to take advantage
 * of the built-in functions if they exist and provide alternative
 * definitions otherwise.
 *
 * HAVE_<func> is undefined or defined as 1 depending on
 * whether or not <func> is available on this system.
 *
 * Authors:	Paul Wessel, Dept. of Geology and Geophysics, SOEST, U Hawaii
 *			   pwessel@hawaii.edu
 *		Remko Scharroo, Altimetrics
 *			   remko@altimetrics.com
 * Version:	5.1 [Decoupled from GMT]
 * Date:	04-MAR-2017
 */

#pragma once
#ifndef _PSL_CONFIG_H
#define _PSL_CONFIG_H

/* compile with ZLIB support <zlib.h> */
#define HAVE_ZLIB

/* shared library */
#define BUILD_SHARED_LIBS

/* system specific headers */

#define HAVE_ASSERT_H_
#define HAVE_UNISTD_H_

/* system specific functions */

#define HAVE_ACCESS
/* #undef HAVE__ACCESS */
#define HAVE_FSEEKO
/* #undef HAVE__FSEEKI64 */
#define HAVE_GETPID
/* #undef HAVE__GETPID */
#define HAVE_VSNPRINTF_
/* #undef HAVE__VSNPRINTF_ */
#define HAVE_STRDUP
#define HAVE_STRTOK_R
/* #undef HAVE_STRTOK_S */
#define DECLARED_STRDUP

/* C types; C99 exact-width integer types <inttypes.h>, <stdint.h>; etc */

/* windows specific */

/* #undef HAVE_DIRECT_H_ */
/* #undef HAVE_IO_H_ */
/* #undef HAVE_PROCESS_H_ */

#define HAVE_CTYPE_H_

/* We prefer to use extensions (e.g., strdup) when available */
#ifdef __GNUC__
#	define _GNU_SOURCE
#endif
#if defined(__sun) || defined(__sun__)
#	ifndef __EXTENSIONS__
#		define __EXTENSIONS__
#	endif
#endif

/* Math related */

#define HAVE_COPYSIGN
/* #undef HAVE__COPYSIGN */
#define HAVE_HYPOT
#define HAVE_LRINT
#define HAVE_RINT

/* Sizes */
#define SIZEOF_INT         4
#define SIZEOF_LONG        8
#define SIZEOF_LONG_LONG   8
#define SIZEOF_OFF_T       8
#define SIZEOF_SIZE_T      8
#define SIZEOF_VOID_P      8
/* #undef WORDS_BIGENDIAN */

/* Must redefine some sizes manually to allow for universal builds on OSX */
#ifdef __APPLE__
#	undef SIZEOF_LONG
#	undef SIZEOF_SIZE_T
#	undef SIZEOF_VOID_P
#	ifdef __LP64__
#		define SIZEOF_LONG      8
#		define SIZEOF_SIZE_T    8
#		define SIZEOF_VOID_P    8
#	else /* !__LP64__ */
#		define SIZEOF_LONG      4
#		define SIZEOF_SIZE_T    4
#		define SIZEOF_VOID_P    4
#	endif /* __LP64__ */
#endif /* __APPLE__ */

/* Byte swapping functions */
#define HAVE___BUILTIN_BSWAP32
/* #undef HAVE__BYTESWAP_ULONG */

#if !(defined(__LP64__) || defined(__LLP64__)) && defined(__x86_64__) && \
		defined(SIZEOF_LONG_LONG) && defined(SIZEOF_LONG) && defined(SIZEOF_INT)
#	if SIZEOF_LONG == 8 && SIZEOF_INT == 4 /* 64 bit longs and pointers (most UNIX) */
#		ifndef __LP64__
#			define __LP64__ 1
#		endif
#	elif SIZEOF_LONG_LONG == 8 && SIZEOF_LONG == 4 /* Win X64/IA-64 */
#		ifndef __LLP64__
#			define __LLP64__ 1
#		endif
#	endif
#endif /* !(defined(__LP64__) || defined(__LLP64__)) && defined(__x86_64__) &&
		defined(SIZEOF_LONG_LONG) && defined(SIZEOF_LONG) && defined(SIZEOF_INT) */

/* Enable 32 bit systems to use files of sizes beyond the usual limit of 2GB */
#if defined(__i386__) && !defined _WIN32 /* on i386 with LFS support */
#	ifdef _LARGEFILE_SOURCE
#		undef _LARGEFILE_SOURCE
#	endif
#	define _LARGEFILE_SOURCE
#	ifdef _FILE_OFFSET_BITS
#		undef _FILE_OFFSET_BITS
#	endif
#	define _FILE_OFFSET_BITS 64
#endif

#endif /* !_PSL_CONFIG_H */

/* vim: set ft=c: */
