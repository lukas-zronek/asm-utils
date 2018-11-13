/*
 * DIR *opendir(const char *filename);
 *
 * This function opens the directory named by filename and returns a DIR
 * structure on success or 0 on error.
 *
 * struct DIR {
 * 	int fd;
 * 	char *buffer;
 * 	int offset;
 * }
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

#include <io.h>
#include <dir.h>

#define FILENAME 8

.bss
	.comm buffer_data, DIR_BUFFER_SIZE
	.comm dir, 12
.text
	.globl opendir
	.type opendir, @function
	opendir:
		pushl %ebp
		movl %esp, %ebp

		movl $O_RDONLY, %eax
		orl $O_DIRECTORY, %eax

		pushl %eax
		pushl FILENAME(%ebp)
		call syscall_open
		addl $8, %esp

		cmpl $-1, %eax
		je .Lerror

		movl %eax, dir+DIR_FD

		pushl $DIR_BUFFER_SIZE
		pushl $buffer_data
		pushl dir+DIR_FD
		call syscall_getdents
		addl $12, %esp

		cmpl $-1, %eax
		je .Lerror

		movl $buffer_data, dir+DIR_BUFFER
		movl $0, dir+DIR_OFFSET

		movl $dir, %eax
	.Lquit:
		movl %ebp, %esp
		popl %ebp
		ret
	.Lerror:
		xorl %eax, %eax
		jmp .Lquit
