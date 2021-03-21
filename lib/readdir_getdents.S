/*
 * char *readdir(DIR *dirp);
 *
 * This function returns a pointer to the next directory name in the directory
 *
 * This implementation uses the getdents syscall of the Linux kernel:
 *
 * 	int getdents(unsigned int fd, struct linux_dirent *dirp,
 *		unsigned int count);
 *
 *	struct linux_dirent {
 *		unsigned long d_ino;
 *		unsigned long d_off;
 *		unsigned short d_reclen;
 *		char d_name[1];
 *	};
 *
 */

#include <dir.h>

#define DIR 8

#define BUFFER -4
#define OFFSET -8
#define NBYTES -12

#define DIRENT_RECLEN_OFFSET 8
#define DIRENT_NAME_OFFSET 10

.text
	.globl readdir
	.type readdir, @function
	readdir:
		pushl %ebp
		movl %esp, %ebp

		subl $-NBYTES, %esp

		pushl %ebx
		pushl %ecx
		pushl %edx

		movl DIR(%ebp), %eax
		movl DIR_BUFFER(%eax), %ebx
		movl %ebx, BUFFER(%ebp)

		xorl %ebx, %ebx
		movw DIR_OFFSET(%eax), %bx
		movl %ebx, OFFSET(%ebp)

		movl DIR_NBYTES(%eax), %ecx

		cmpl %ebx, %ecx
		jg .Lreaddir_skip_getdents

		pushl $DIR_BUFFER_SIZE
		pushl BUFFER(%ebp)
		pushl DIR_FD(%eax)
		call syscall_getdents
		addl $12, %esp

		movl DIR(%ebp), %ebx
		movl %eax, DIR_NBYTES(%ebx)

		movl $0, OFFSET(%ebp)

		cmpl $0, %eax
		jle .Lquit
	.Lreaddir_skip_getdents:
		movl BUFFER(%ebp), %ebx

		movl OFFSET(%ebp), %ecx

		addl %ecx, %ebx

		xorl %edx, %edx
		movw DIRENT_RECLEN_OFFSET(%ebx), %dx

		addl %edx, %ecx

		movl %ecx, OFFSET(%ebp)

		leal DIRENT_NAME_OFFSET(%ebx), %eax
	.Lquit:
		movl DIR(%ebp), %ebx
		movl OFFSET(%ebp), %ecx
		movl %ecx, DIR_OFFSET(%ebx)

		popl %edx
		popl %ecx
		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
