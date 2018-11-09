/*
 * char *readdir(DIR *dirp);
 *
 * This function returns a pointer to the next directory name in the directory
 *
 * This implementation uses the getdirentries syscall of FreeBSD and macOS:
 *
 * 	int getdirentries(int fd, char *buf, u_int count, long *basep);
 *
 *	struct dirent {
 *		__uint32_t d_fileno;
 *		__uint16_t d_reclen;
 *		__uint8_t  d_type;
 *		__uint8_t  d_namlen;
 *		char       d_name[255 + 1];
 *	};
 *
 *	typedef unsigned int __uint32_t;
 *	typedef	unsigned short __uint16_t;
 *	typedef	unsigned char __uint8_t;
 *
 */

#include <dir.h>

#define DIR 8

#define DIRENT_RECLEN_OFFSET 4
#define DIRENT_TYPE_OFFSET 6
#define DIRENT_NAME_OFFSET 8
#define DIRENT_TYPE_REG 8

.text
	.globl readdir
	.type readdir, @function
	readdir:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx
		pushl %ecx

		movl DIR(%ebp), %eax
		movl DIR_BUFFER(%eax), %ebx
		addl DIR_OFFSET(%eax), %ebx

		/* save offset to next dirent */
		xorl %ecx, %ecx
		movw DIRENT_RECLEN_OFFSET(%ebx), %cx /* unsigned short/__uint16_t (2 Bytes) */
		addl %ecx, DIR_OFFSET(%eax)

		xorl %eax, %eax

		cmpl $0, %ecx
		je .Lquit

		leal DIRENT_NAME_OFFSET(%ebx), %eax
	.Lquit:
		popl %ecx
		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
