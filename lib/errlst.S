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
	.L.error.0:
		.asciz "No error: 0"				/*  0 - ENOERROR */
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

/* math software */
	.L.error.33:
		.asciz "Numerical argument out of domain"	/* 33 - EDOM */
	.L.error.34:
		.asciz "Result too large"			/* 34 - ERANGE */

/* non-blocking and interrupt i/o */
	.L.error.35:
		.asciz "Resource temporarily unavailable"	/* 35 - EAGAIN */
						/* 35 - EWOULDBLOCK */
	.L.error.36:
		.asciz "Operation now in progress"		/* 36 - EINPROGRESS */
	.L.error.37:
		.asciz "Operation already in progress"	/* 37 - EALREADY */

/* ipc/network software -- argument errors */
	.L.error.38:
		.asciz "Socket operation on non-socket"	/* 38 - ENOTSOCK */
	.L.error.39:
		.asciz "Destination address required"		/* 39 - EDESTADDRREQ */
	.L.error.40:
		.asciz "Message too long"			/* 40 - EMSGSIZE */
	.L.error.41:
		.asciz "Protocol wrong type for socket"	/* 41 - EPROTOTYPE */
	.L.error.42:
		.asciz "Protocol not available"		/* 42 - ENOPROTOOPT */
	.L.error.43:
		.asciz "Protocol not supported"		/* 43 - EPROTONOSUPPORT */
	.L.error.44:
		.asciz "Socket type not supported"		/* 44 - ESOCKTNOSUPPORT */
	.L.error.45:
		.asciz "Operation not supported"		/* 45 - EOPNOTSUPP */
	.L.error.46:
		.asciz "Protocol family not supported"	/* 46 - EPFNOSUPPORT */
						/* 47 - EAFNOSUPPORT */
	.L.error.47:
		.asciz "Address family not supported by protocol family"
	.L.error.48:
		.asciz "Address already in use"		/* 48 - EADDRINUSE */
	.L.error.49:
		.asciz "Can't assign requested address"	/* 49 - EADDRNOTAVAIL */

/* ipc/network software -- operational errors */
	.L.error.50:
		.asciz "Network is down"			/* 50 - ENETDOWN */
	.L.error.51:
		.asciz "Network is unreachable"		/* 51 - ENETUNREACH */
	.L.error.52:
		.asciz "Network dropped connection on reset"	/* 52 - ENETRESET */
	.L.error.53:
		.asciz "Software caused connection abort"	/* 53 - ECONNABORTED */
	.L.error.54:
		.asciz "Connection reset by peer"		/* 54 - ECONNRESET */
	.L.error.55:
		.asciz "No buffer space available"		/* 55 - ENOBUFS */
	.L.error.56:
		.asciz "Socket is already connected"		/* 56 - EISCONN */
	.L.error.57:
		.asciz "Socket is not connected"		/* 57 - ENOTCONN */
	.L.error.58:
		.asciz "Can't send after socket shutdown"	/* 58 - ESHUTDOWN */
	.L.error.59:
		.asciz "Too many references: can't splice"	/* 59 - ETOOMANYREFS */
	.L.error.60:
		.asciz "Operation timed out"			/* 60 - ETIMEDOUT */
	.L.error.61:
		.asciz "Connection refused"			/* 61 - ECONNREFUSED */

	.L.error.62:
		.asciz "Too many levels of symbolic links"	/* 62 - ELOOP */
	.L.error.63:
		.asciz "File name too long"			/* 63 - ENAMETOOLONG */

/* should be rearranged */
	.L.error.64:
		.asciz "Host is down"				/* 64 - EHOSTDOWN */
	.L.error.65:
		.asciz "No route to host"			/* 65 - EHOSTUNREACH */
	.L.error.66:
		.asciz "Directory not empty"			/* 66 - ENOTEMPTY */

/* quotas & mush */
	.L.error.67:
		.asciz "Too many processes"			/* 67 - EPROCLIM */
	.L.error.68:
		.asciz "Too many users"			/* 68 - EUSERS */
	.L.error.69:
		.asciz "Disc quota exceeded"			/* 69 - EDQUOT */

/* Network File System */
	.L.error.70:
		.asciz "Stale NFS file handle"		/* 70 - ESTALE */
	.L.error.71:
		.asciz "Too many levels of remote in path"	/* 71 - EREMOTE */
	.L.error.72:
		.asciz "RPC struct is bad"			/* 72 - EBADRPC */
	.L.error.73:
		.asciz "RPC version wrong"			/* 73 - ERPCMISMATCH */
	.L.error.74:
		.asciz "RPC prog. not avail"			/* 74 - EPROGUNAVAIL */
	.L.error.75:
		.asciz "Program version wrong"		/* 75 - EPROGMISMATCH */
	.L.error.76:
		.asciz "Bad procedure for program"		/* 76 - EPROCUNAVAIL */

	.L.error.77:
		.asciz "No locks available"			/* 77 - ENOLCK */
	.L.error.78:
		.asciz "Function not implemented"		/* 78 - ENOSYS */
	.L.error.79:
		.asciz "Inappropriate file type or format"	/* 79 - EFTYPE */
	.L.error.80:
		.asciz "Authentication error"			/* 80 - EAUTH */
	.L.error.81:
		.asciz "Need authenticator"			/* 81 - ENEEDAUTH */
	.L.error.82:
		.asciz "Identifier removed"			/* 82 - EIDRM */
	.L.error.83:
		.asciz "No message of desired type"		/* 83 - ENOMSG */
	.L.error.84:
		.asciz "Value too large to be stored in data type" /* 84 - EOVERFLOW */
	.L.error.85:
		.asciz "Operation canceled"			/* 85 - ECANCELED */
	.L.error.86:
		.asciz "Illegal byte sequence"		/* 86 - EILSEQ */
	.L.error.87:
		.asciz "Attribute not found"			/* 87 - ENOATTR */
	
/* General */
	.L.error.88:
		.asciz "Programming error"			/* 88 - EDOOFUS */

	.L.error.89:
		.asciz "Bad message"				/* 89 - EBADMSG */
	.L.error.90:
		.asciz "Multihop attempted"			/* 90 - EMULTIHOP */
	.L.error.91:
		.asciz "Link has been severed"		/* 91 - ENOLINK */
	.L.error.92:
		.asciz "Protocol error"			/* 92 - EPROTO */
	.L.error.93:
		.asciz "Capabilities insufficient"		/* 93 - ENOTCAPABLE */
	.L.error.94:
		.asciz "Not permitted in capability mode"	/* 94 - ECAPMODE */
	.L.error.95:
		.asciz "State not recoverable"		/* 95 - ENOTRECOVERABLE */
	.L.error.96:
		.asciz "Previous owner died"			/* 96 - EOWNERDEAD */

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
		.long	.L.error.33
		.long	.L.error.34
		.long	.L.error.35
		.long	.L.error.36
		.long	.L.error.37
		.long	.L.error.38
		.long	.L.error.39
		.long	.L.error.40
		.long	.L.error.41
		.long	.L.error.42
		.long	.L.error.43
		.long	.L.error.44
		.long	.L.error.45
		.long	.L.error.46
		.long	.L.error.47
		.long	.L.error.48
		.long	.L.error.49
		.long	.L.error.50
		.long	.L.error.51
		.long	.L.error.52
		.long	.L.error.53
		.long	.L.error.54
		.long	.L.error.55
		.long	.L.error.56
		.long	.L.error.57
		.long	.L.error.58
		.long	.L.error.59
		.long	.L.error.60
		.long	.L.error.61
		.long	.L.error.62
		.long	.L.error.63
		.long	.L.error.64
		.long	.L.error.65
		.long	.L.error.66
		.long	.L.error.67
		.long	.L.error.68
		.long	.L.error.69
		.long	.L.error.70
		.long	.L.error.71
		.long	.L.error.72
		.long	.L.error.73
		.long	.L.error.74
		.long	.L.error.75
		.long	.L.error.76
		.long	.L.error.77
		.long	.L.error.78
		.long	.L.error.79
		.long	.L.error.80
		.long	.L.error.81
		.long	.L.error.82
		.long	.L.error.83
		.long	.L.error.84
		.long	.L.error.85
		.long	.L.error.86
		.long	.L.error.87
		.long	.L.error.88
		.long	.L.error.89
		.long	.L.error.90
		.long	.L.error.91
		.long	.L.error.92
		.long	.L.error.93
		.long	.L.error.94
		.long	.L.error.95
		.long	.L.error.96

	.globl sys_nerr
	sys_nerr:
		.long 97
