/*
 * Copyright (c) 1982, 1985, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */
/*
 * The list of error conditions was derived from FreeBSD:
 * 	$FreeBSD: releng/11.1/lib/libc/gen/errlst.c 275004 2014-11-25 03:50:31Z emaste $
 *
 * extern const char * const sys_errlist[];
 * extern const int sys_nerr;
 */

.rodata
	.L.error.0:
		.asciz "Undefined error: 0"				/*  0 - ENOERROR */
	.L.error.1:
		.asciz "Operation not permitted"		/*  1 - EPERM */
	.L.error.2:
		.asciz "No such file or directory"		/*  2 - ENOENT */
	.L.error.3:
		.asciz "No such process"			/*  3 - ESRCH */
	.L.error.4:
		.asciz "Interrupted system call"		/*  4 - EINTR */
	.L.error.5:
		.asciz "Input/output error"			/*  5 - EIO */
	.L.error.6:
		.asciz "Device not configured"		/*  6 - ENXIO */
	.L.error.7:
		.asciz "Argument list too long"		/*  7 - E2BIG */
	.L.error.8:
		.asciz "Exec format error"			/*  8 - ENOEXEC */
	.L.error.9:
		.asciz "Bad file descriptor"			/*  9 - EBADF */
	.L.error.10:
		.asciz "No child processes"			/* 10 - ECHILD */
	.L.error.11:
		.asciz "Resource deadlock avoided"		/* 11 - EDEADLK */
	.L.error.12:
		.asciz "Cannot allocate memory"		/* 12 - ENOMEM */
	.L.error.13:
		.asciz "Permission denied"			/* 13 - EACCES */
	.L.error.14:
		.asciz "Bad address"				/* 14 - EFAULT */
	.L.error.15:
		.asciz "Block device required"		/* 15 - ENOTBLK */
	.L.error.16:
		.asciz "Device busy"				/* 16 - EBUSY */
	.L.error.17:
		.asciz "File exists"				/* 17 - EEXIST */
	.L.error.18:
		.asciz "Cross-device link"			/* 18 - EXDEV */
	.L.error.19:
		.asciz "Operation not supported by device"	/* 19 - ENODEV */
	.L.error.20:
		.asciz "Not a directory"			/* 20 - ENOTDIR */
	.L.error.21:
		.asciz "Is a directory"			/* 21 - EISDIR */
	.L.error.22:
		.asciz "Invalid argument"			/* 22 - EINVAL */
	.L.error.23:
		.asciz "Too many open files in system"	/* 23 - ENFILE */
	.L.error.24:
		.asciz "Too many open files"			/* 24 - EMFILE */
	.L.error.25:
		.asciz "Inappropriate ioctl for device"	/* 25 - ENOTTY */
	.L.error.26:
		.asciz "Text file busy"			/* 26 - ETXTBSY */
	.L.error.27:
		.asciz "File too large"			/* 27 - EFBIG */
	.L.error.28:
		.asciz "No space left on device"		/* 28 - ENOSPC */
	.L.error.29:
		.asciz "Illegal seek"				/* 29 - ESPIPE */
	.L.error.30:
		.asciz "Read-only file system"		/* 30 - EROFS */
	.L.error.31:
		.asciz "Too many links"			/* 31 - EMLINK */
	.L.error.32:
		.asciz "Broken pipe"				/* 32 - EPIPE */

	.globl sys_errlist
	sys_errlist:
		.long	.L.error.0
		.long	.L.error.1
		.long	.L.error.2
		.long	.L.error.3
		.long	.L.error.4
		.long	.L.error.5
		.long	.L.error.6
		.long	.L.error.7
		.long	.L.error.8
		.long	.L.error.9
		.long	.L.error.10
		.long	.L.error.11
		.long	.L.error.12
		.long	.L.error.13
		.long	.L.error.14
		.long	.L.error.15
		.long	.L.error.16
		.long	.L.error.17
		.long	.L.error.18
		.long	.L.error.19
		.long	.L.error.20
		.long	.L.error.21
		.long	.L.error.22
		.long	.L.error.23
		.long	.L.error.24
		.long	.L.error.25
		.long	.L.error.26
		.long	.L.error.27
		.long	.L.error.28
		.long	.L.error.29
		.long	.L.error.30
		.long	.L.error.31
		.long	.L.error.32

	.globl sys_nerr
	sys_nerr:
		.long 33
