/*
 * char *readdir(DIR *dirp);
 *
 * This function returns a pointer to the next directory name in the directory
 */

#include <dir.h>

#define DIR 8

#define DIRENT_RECLEN_OFFSET 8
#define DIRENT_NAME_OFFSET 10

.text
	.globl readdir
	.type readdir, @function
	readdir:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx
		pushl %ecx

		/*
		struct linux_dirent {
			unsigned long d_ino;
			unsigned long d_off;
			unsigned short d_reclen;
			char d_name[1];
		};
		*/

		movl DIR(%ebp), %eax
		movl DIR_BUFFER(%eax), %ebx
		addl DIR_OFFSET(%eax), %ebx

		/* save offset to next dirent */
		xorl %ecx, %ecx
		movw DIRENT_RECLEN_OFFSET(%ebx), %cx /* unsigned short int (2 Bytes) */
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
