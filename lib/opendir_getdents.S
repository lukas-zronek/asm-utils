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
 * This implementation uses the getdents syscall of the Linux kernel.
 *
 */

#include <io.h>
#include <dir.h>

#define FILENAME 8

.bss
	.comm buffer_data, DIR_BUFFER_SIZE
	.comm dir, 16
.text
	.globl opendir
	.type opendir, @function
	opendir:
		pushl %ebp
		movl %esp, %ebp

		movl $O_RDONLY, %eax
		orl $O_DIRECTORY, %eax

		pushl $0
		pushl %eax
		pushl FILENAME(%ebp)
		call syscall_open
		addl $12, %esp

		cmpl $-1, %eax
		je .Lerror

		movl %eax, dir+DIR_FD

		movl $buffer_data, dir+DIR_BUFFER
		movl $0, dir+DIR_OFFSET
		movl $0, dir+DIR_NBYTES

		movl $dir, %eax
	.Lquit:
		movl %ebp, %esp
		popl %ebp
		ret
	.Lerror:
		xorl %eax, %eax
		jmp .Lquit
