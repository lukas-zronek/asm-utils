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
# derived from $FreeBSD: releng/11.1/lib/libc/gen/errlst.c 275004 2014-11-25 03:50:31Z emaste $

# extern const char * const sys_errlist[];
# extern const int sys_nerr;
.data
	error.0:
		.asciz "No error: 0"				/*  0 - ENOERROR */
	error.1:
		.asciz "Operation not permitted"		/*  1 - EPERM */
	error.2:
		.asciz "No such file or directory"		/*  2 - ENOENT */
	error.3:
		.asciz "No such process"			/*  3 - ESRCH */
	error.4:
		.asciz "Interrupted system call"		/*  4 - EINTR */
	error.5:
		.asciz "Input/output error"			/*  5 - EIO */
	error.6:
		.asciz "Device not configured"		/*  6 - ENXIO */
	error.7:
		.asciz "Argument list too long"		/*  7 - E2BIG */
	error.8:
		.asciz "Exec format error"			/*  8 - ENOEXEC */
	error.9:
		.asciz "Bad file descriptor"			/*  9 - EBADF */
	error.10:
		.asciz "No child processes"			/* 10 - ECHILD */
	error.11:
		.asciz "Resource deadlock avoided"		/* 11 - EDEADLK */
	error.12:
		.asciz "Cannot allocate memory"		/* 12 - ENOMEM */
	error.13:
		.asciz "Permission denied"			/* 13 - EACCES */
	error.14:
		.asciz "Bad address"				/* 14 - EFAULT */
	error.15:
		.asciz "Block device required"		/* 15 - ENOTBLK */
	error.16:
		.asciz "Device busy"				/* 16 - EBUSY */
	error.17:
		.asciz "File exists"				/* 17 - EEXIST */
	error.18:
		.asciz "Cross-device link"			/* 18 - EXDEV */
	error.19:
		.asciz "Operation not supported by device"	/* 19 - ENODEV */
	error.20:
		.asciz "Not a directory"			/* 20 - ENOTDIR */
	error.21:
		.asciz "Is a directory"			/* 21 - EISDIR */
	error.22:
		.asciz "Invalid argument"			/* 22 - EINVAL */
	error.23:
		.asciz "Too many open files in system"	/* 23 - ENFILE */
	error.24:
		.asciz "Too many open files"			/* 24 - EMFILE */
	error.25:
		.asciz "Inappropriate ioctl for device"	/* 25 - ENOTTY */
	error.26:
		.asciz "Text file busy"			/* 26 - ETXTBSY */
	error.27:
		.asciz "File too large"			/* 27 - EFBIG */
	error.28:
		.asciz "No space left on device"		/* 28 - ENOSPC */
	error.29:
		.asciz "Illegal seek"				/* 29 - ESPIPE */
	error.30:
		.asciz "Read-only file system"		/* 30 - EROFS */
	error.31:
		.asciz "Too many links"			/* 31 - EMLINK */
	error.32:
		.asciz "Broken pipe"				/* 32 - EPIPE */

/* math software */
	error.33:
		.asciz "Numerical argument out of domain"	/* 33 - EDOM */
	error.34:
		.asciz "Result too large"			/* 34 - ERANGE */

/* non-blocking and interrupt i/o */
	error.35:
		.asciz "Resource temporarily unavailable"	/* 35 - EAGAIN */
						/* 35 - EWOULDBLOCK */
	error.36:
		.asciz "Operation now in progress"		/* 36 - EINPROGRESS */
	error.37:
		.asciz "Operation already in progress"	/* 37 - EALREADY */

/* ipc/network software -- argument errors */
	error.38:
		.asciz "Socket operation on non-socket"	/* 38 - ENOTSOCK */
	error.39:
		.asciz "Destination address required"		/* 39 - EDESTADDRREQ */
	error.40:
		.asciz "Message too long"			/* 40 - EMSGSIZE */
	error.41:
		.asciz "Protocol wrong type for socket"	/* 41 - EPROTOTYPE */
	error.42:
		.asciz "Protocol not available"		/* 42 - ENOPROTOOPT */
	error.43:
		.asciz "Protocol not supported"		/* 43 - EPROTONOSUPPORT */
	error.44:
		.asciz "Socket type not supported"		/* 44 - ESOCKTNOSUPPORT */
	error.45:
		.asciz "Operation not supported"		/* 45 - EOPNOTSUPP */
	error.46:
		.asciz "Protocol family not supported"	/* 46 - EPFNOSUPPORT */
						/* 47 - EAFNOSUPPORT */
	error.47:
		.asciz "Address family not supported by protocol family"
	error.48:
		.asciz "Address already in use"		/* 48 - EADDRINUSE */
	error.49:
		.asciz "Can't assign requested address"	/* 49 - EADDRNOTAVAIL */

/* ipc/network software -- operational errors */
	error.50:
		.asciz "Network is down"			/* 50 - ENETDOWN */
	error.51:
		.asciz "Network is unreachable"		/* 51 - ENETUNREACH */
	error.52:
		.asciz "Network dropped connection on reset"	/* 52 - ENETRESET */
	error.53:
		.asciz "Software caused connection abort"	/* 53 - ECONNABORTED */
	error.54:
		.asciz "Connection reset by peer"		/* 54 - ECONNRESET */
	error.55:
		.asciz "No buffer space available"		/* 55 - ENOBUFS */
	error.56:
		.asciz "Socket is already connected"		/* 56 - EISCONN */
	error.57:
		.asciz "Socket is not connected"		/* 57 - ENOTCONN */
	error.58:
		.asciz "Can't send after socket shutdown"	/* 58 - ESHUTDOWN */
	error.59:
		.asciz "Too many references: can't splice"	/* 59 - ETOOMANYREFS */
	error.60:
		.asciz "Operation timed out"			/* 60 - ETIMEDOUT */
	error.61:
		.asciz "Connection refused"			/* 61 - ECONNREFUSED */

	error.62:
		.asciz "Too many levels of symbolic links"	/* 62 - ELOOP */
	error.63:
		.asciz "File name too long"			/* 63 - ENAMETOOLONG */

/* should be rearranged */
	error.64:
		.asciz "Host is down"				/* 64 - EHOSTDOWN */
	error.65:
		.asciz "No route to host"			/* 65 - EHOSTUNREACH */
	error.66:
		.asciz "Directory not empty"			/* 66 - ENOTEMPTY */

/* quotas & mush */
	error.67:
		.asciz "Too many processes"			/* 67 - EPROCLIM */
	error.68:
		.asciz "Too many users"			/* 68 - EUSERS */
	error.69:
		.asciz "Disc quota exceeded"			/* 69 - EDQUOT */

/* Network File System */
	error.70:
		.asciz "Stale NFS file handle"		/* 70 - ESTALE */
	error.71:
		.asciz "Too many levels of remote in path"	/* 71 - EREMOTE */
	error.72:
		.asciz "RPC struct is bad"			/* 72 - EBADRPC */
	error.73:
		.asciz "RPC version wrong"			/* 73 - ERPCMISMATCH */
	error.74:
		.asciz "RPC prog. not avail"			/* 74 - EPROGUNAVAIL */
	error.75:
		.asciz "Program version wrong"		/* 75 - EPROGMISMATCH */
	error.76:
		.asciz "Bad procedure for program"		/* 76 - EPROCUNAVAIL */

	error.77:
		.asciz "No locks available"			/* 77 - ENOLCK */
	error.78:
		.asciz "Function not implemented"		/* 78 - ENOSYS */
	error.79:
		.asciz "Inappropriate file type or format"	/* 79 - EFTYPE */
	error.80:
		.asciz "Authentication error"			/* 80 - EAUTH */
	error.81:
		.asciz "Need authenticator"			/* 81 - ENEEDAUTH */
	error.82:
		.asciz "Identifier removed"			/* 82 - EIDRM */
	error.83:
		.asciz "No message of desired type"		/* 83 - ENOMSG */
	error.84:
		.asciz "Value too large to be stored in data type" /* 84 - EOVERFLOW */
	error.85:
		.asciz "Operation canceled"			/* 85 - ECANCELED */
	error.86:
		.asciz "Illegal byte sequence"		/* 86 - EILSEQ */
	error.87:
		.asciz "Attribute not found"			/* 87 - ENOATTR */
	
/* General */
	error.88:
		.asciz "Programming error"			/* 88 - EDOOFUS */

	error.89:
		.asciz "Bad message"				/* 89 - EBADMSG */
	error.90:
		.asciz "Multihop attempted"			/* 90 - EMULTIHOP */
	error.91:
		.asciz "Link has been severed"		/* 91 - ENOLINK */
	error.92:
		.asciz "Protocol error"			/* 92 - EPROTO */
	error.93:
		.asciz "Capabilities insufficient"		/* 93 - ENOTCAPABLE */
	error.94:
		.asciz "Not permitted in capability mode"	/* 94 - ECAPMODE */
	error.95:
		.asciz "State not recoverable"		/* 95 - ENOTRECOVERABLE */
	error.96:
		.asciz "Previous owner died"			/* 96 - EOWNERDEAD */

	.globl sys_errlist
	sys_errlist:
		.long	error.0
		.long	error.1
		.long	error.2
		.long	error.3
		.long	error.4
		.long	error.5
		.long	error.6
		.long	error.7
		.long	error.8
		.long	error.9
		.long	error.10
		.long	error.11
		.long	error.12
		.long	error.13
		.long	error.14
		.long	error.15
		.long	error.16
		.long	error.17
		.long	error.18
		.long	error.19
		.long	error.20
		.long	error.21
		.long	error.22
		.long	error.23
		.long	error.24
		.long	error.25
		.long	error.26
		.long	error.27
		.long	error.28
		.long	error.29
		.long	error.30
		.long	error.31
		.long	error.32
		.long	error.33
		.long	error.34
		.long	error.35
		.long	error.36
		.long	error.37
		.long	error.38
		.long	error.39
		.long	error.40
		.long	error.41
		.long	error.42
		.long	error.43
		.long	error.44
		.long	error.45
		.long	error.46
		.long	error.47
		.long	error.48
		.long	error.49
		.long	error.50
		.long	error.51
		.long	error.52
		.long	error.53
		.long	error.54
		.long	error.55
		.long	error.56
		.long	error.57
		.long	error.58
		.long	error.59
		.long	error.60
		.long	error.61
		.long	error.62
		.long	error.63
		.long	error.64
		.long	error.65
		.long	error.66
		.long	error.67
		.long	error.68
		.long	error.69
		.long	error.70
		.long	error.71
		.long	error.72
		.long	error.73
		.long	error.74
		.long	error.75
		.long	error.76
		.long	error.77
		.long	error.78
		.long	error.79
		.long	error.80
		.long	error.81
		.long	error.82
		.long	error.83
		.long	error.84
		.long	error.85
		.long	error.86
		.long	error.87
		.long	error.88
		.long	error.89
		.long	error.90
		.long	error.91
		.long	error.92
		.long	error.93
		.long	error.94
		.long	error.95
		.long	error.96

	.globl sys_nerr
	sys_nerr:
		.long 97
