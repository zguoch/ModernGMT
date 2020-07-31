/*
 *
 *  Copyright (c) 1991-2018 by P. Wessel, W. H. F. Smith, R. Scharroo,
 *  F. Wobbe, and J. Luis
 * See LICENSE.TXT file for copying and redistribution conditions.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3 or any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
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
 * GMT function, or simply a macro.  The purpose is to take advantage
 * of the built-in functions if they exist and provide alternative
 * definitions otherwise.
 *
 * HAVE_<func> is undefined or defined as 1 depending on
 * whether or not <func> is available on this system.
 *
 * For adding more HAVE_**** checks, see ConfigureChecks.cmake.
 *
 * Version: GMT 6.0.0_c4437e4-dirty
 */

#pragma once
#ifndef _GMT_CONFIG_H
#define _GMT_CONFIG_H

#include "config.h"


/* which regex library <pcre.h>, <pcre2.h>, <regex.h> */
#define HAVE_PCRE
/* #undef HAVE_PCRE2 */
/* #undef HAVE_POSIX_ERE */

/* compile with GDAL support <gdal.h> */
#define HAVE_GDAL

/* compile with LAPACK support */
#define HAVE_LAPACK

/* compile with BLAS support */
#define HAVE_BLAS

/* compile with FFTW3 support <fftw3.h> */
#define HAVE_FFTW3F
#define HAVE_FFTW3F_THREADS

/* compile with ZLIB support <zlib.h> */
#define HAVE_ZLIB

/* compile with GLIB GThread support <glib.h> */
/* #undef HAVE_GLIB_GTHREAD */

/* compile with pthreads support <pthread.h> */
#define HAVE_PTHREAD

/* compile with WEBKIT support */
/* #undef HAVE_WEBKIT */

/* shared library */
#define BUILD_SHARED_LIBS

/* set license restrictions */
/* #undef LICENSE_RESTRICTED */
#ifndef LICENSE_RESTRICTED
	/* enable Shewchuk's triangle routine */
#	define TRIANGLE_D
#endif

/* applies only #ifdef _WIN32 */
/* #undef USE_MEM_ALIGNED */

/* if NetCDF is static; applies only #ifdef _WIN32 */
/* #undef NETCDF_STATIC */

/* system specific headers */

#define HAVE_ASSERT_H_
#define HAVE_DIRENT_H_
#define HAVE_ERRNO_H_
#define HAVE_EXECINFO_H_
#define HAVE_FCNTL_H_
#define HAVE_SIGNAL_H_
#define HAVE_SYS_DIR_H_
#define HAVE_SYS_RESOURCE_H_
#define HAVE_SYS_STAT_H_
#define HAVE_SYS_TIME_H_
#define HAVE_SYS_UCONTEXT_H_
#define HAVE_UNISTD_H_

/* system specific functions */

#define HAVE_ACCESS
/* #undef HAVE__ACCESS */
#define HAVE_BASENAME
#define HAVE_DLADDR
#define HAVE_FCNTL
#define HAVE_FILENO
/* #undef HAVE__FILENO */
#define HAVE_FSEEKO
#define HAVE_FTELLO
/* #undef HAVE__FSEEKI64 */
/* #undef HAVE__FTELLI64 */
#define HAVE___FUNC__
#define HAVE___FUNCTION__
/* #undef HAVE__GETCWD */
#define HAVE_GETPID
/* #undef HAVE__GETPID */
#define HAVE_GETPWUID
#define HAVE_LLABS
/* #undef HAVE_MEMALIGN */
/* #undef HAVE__MKDIR */
#define HAVE_PCLOSE
/* #undef HAVE__PCLOSE */
#define HAVE_POPEN
/* #undef HAVE__POPEN */
#define HAVE_POSIX_MEMALIGN 1
/* #undef HAVE_QSORT_R_GLIBC */
#define HAVE_SETLOCALE
/* #undef HAVE__SETMODE */
#define HAVE_SNPRINTF_
/* #undef HAVE__SNPRINTF_ */
#define HAVE_VSNPRINTF_
/* #undef HAVE__VSNPRINTF_ */
/* #undef HAVE__STAT */
/* #undef HAVE__STATI64 */
#define HAVE_STRCASECMP
#define HAVE_STRNCASECMP
/* #undef HAVE_STRICMP */
/* #undef HAVE_STRNICMP */
#define HAVE_STRDUP
#define HAVE_STRNDUP
#define HAVE_STRSEP
#define HAVE_STRTOD
#define HAVE_STRTOF_
#define HAVE_STRTOK_R
/* #undef HAVE_STRTOK_S */
#define DECLARED_STRDUP
#define DECLARED_STRSEP

/* sysconf/sysctl */
/* #undef HAVE_SC_NPROC_ONLN */
#define HAVE_SC_NPROCESSORS_ONLN
#define HAVE_SYSCTL_HW_NCPU

/* support for inline functions */
#define HAVE_C_inline
/* #undef HAVE_C___inline */
/* #undef HAVE_C___inline__ */
#ifndef HAVE_C_inline
#	if defined(HAVE_C___inline)
#		define inline __inline
#	elif defined(HAVE_C___inline__)
#		define inline __inline__
#	else
#		define inline /* not supported */
#	endif
#endif /* !HAVE_C_inline */

/* windows specific */

/* #undef HAVE_DIRECT_H_ */
/* #undef HAVE_IO_H_ */
/* #undef HAVE_PROCESS_H_ */

/* C types; C99 exact-width integer types <inttypes.h>, <stdint.h>; etc */

#define HAVE_CTYPE_H_
#define HAVE_STDDEF_H_
#define HAVE_SYS_TYPES_H_

/* We prefer to use extensions (e.g., strdup, sincos) when available */
#ifdef __GNUC__
#	define _GNU_SOURCE
#endif
#if defined(__sun) || defined(__sun__)
#	ifndef __EXTENSIONS__
#		define __EXTENSIONS__
#	endif
#endif

/* Math headers */

/* #undef HAVE_FLOATINGPOINT_H_ */
/* #undef HAVE_IEEEFP_H_ */

/* Math related */

#define HAVE_ACOSF
#define HAVE_ACOSH
#define HAVE_ACOSHF
#define HAVE_ASINF
#define HAVE_ASINH
#define HAVE_ASINHF
#define HAVE_ATANF
#define HAVE_ATANH
#define HAVE_ATANHF
#define HAVE_ATAN2F
/* #undef HAVE_COPYSIGNF */
#define HAVE_COPYSIGN
/* #undef HAVE__COPYSIGN */
#define HAVE_CEILF
#define HAVE_COSF
#define HAVE_COSHF
#define HAVE_ERF
#define HAVE_ERFF
#define HAVE_ERFC
#define HAVE_ERFCF
#define HAVE_EXPF
#define HAVE_FABSF
#define HAVE_FLOORF
#define HAVE_FMODF
/* #undef HAVE__FINITE */
/* #undef HAVE__FPCLASS */
#define HAVE_HYPOT
#define HAVE_HYPOTF
#define HAVE_ISFINITE
#define HAVE_ISINF
#define HAVE_ISNAN
/* #undef HAVE_ISNAND */
/* #undef HAVE_ISNANF */
/* #undef HAVE__ISNAN */
#define HAVE_ISNORMAL
#define HAVE_J0
#define HAVE_J1
#define HAVE_JN
#define HAVE_LRINT
#define HAVE_LRINTF
#define HAVE_LOGF
#define HAVE_LOG10F
#define HAVE_LOG1P
#define HAVE_LOG1PF
#define HAVE_LOG2
#define HAVE_LOG2F
#define HAVE_POWF
#define HAVE_RINT
#define HAVE_RINTF
#define HAVE_SINF
#define HAVE_SINHF
/* #undef HAVE_SINCOS */
#define HAVE_SQRTF
#define HAVE_TANF
#define HAVE_TANHF
#define HAVE_Y0
#define HAVE_Y1
#define HAVE_YN

/* Sizes */
#define SIZEOF__BOOL       1
/* #undef SIZEOF_BOOL */
#define SIZEOF_INT         4
/* #undef SIZEOF_GREG_T */
#define SIZEOF_LONG        8
#define SIZEOF_LONG_LONG   8
#define SIZEOF_LONG_DOUBLE 16
#define SIZEOF_MODE_T      2
#define SIZEOF_OFF_T       8
#define SIZEOF_SIZE_T      8
#define SIZEOF_WCHAR_T     4
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
#define HAVE___BUILTIN_BSWAP16
#define HAVE___BUILTIN_BSWAP32
#define HAVE___BUILTIN_BSWAP64
/* #undef HAVE__BYTESWAP_USHORT */
/* #undef HAVE__BYTESWAP_ULONG */
/* #undef HAVE__BYTESWAP_UINT64 */

#if 0	/* PW: Commented out; see issue # 614 */
/* Architecture type (32/64 bits) */
#if !defined(__x86_64__) && !defined(__i386__) && SIZEOF_VOID_P == 4 /* on i386 */
#	define __i386__ 1
#elif !defined(__x86_64__) && !defined(__i386__) && SIZEOF_VOID_P == 8 /* on x86_64 */
#	define __x86_64__ 1
#endif
#endif

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

/* Check whether conditions for sighandler are met */
#if !(defined(HAVE_SIGNAL_H_) && defined(HAVE_SYS_RESOURCE_H_) && \
			defined(HAVE_SYS_TIME_H_) && defined(HAVE_SYS_UCONTEXT_H_))
#	define NO_SIGHANDLER
#endif

#endif /* !_GMT_CONFIG_H */

/* vim: set ft=c: */
