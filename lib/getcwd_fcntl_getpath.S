/*
 * char * getcwd(char *buf, size_t size);
 *
 */

#include <io.h>

#define F_GETPATH 50

.rodata
	.L.cwd:
		.asciz "."

#define BUF 8
#define SIZE 12
#define FD -4

.text
	.globl getcwd
	.type getcwd, @function
	getcwd:
		pushl %ebp
		movl %esp, %ebp

		subl $-FD, %esp

		movl $O_RDONLY, %eax
		orl $O_DIRECTORY, %eax

		pushl %eax
		pushl $.L.cwd
		call syscall_open
		addl $8, %esp

		cmpl $-1, %eax
		je .Lerror

		movl %eax, FD(%ebp)

		pushl BUF(%ebp)
		pushl $F_GETPATH
		pushl %eax
		call syscall_fcntl
		addl $12, %esp

		cmpl $0, %eax
		jne .Lerror

		pushl FD(%ebp)
		call syscall_close
		addl $4, %esp

		cmpl $0, %eax
		jne .Lerror

		movl BUF(%ebp), %eax
	.Lquit:
		movl %ebp, %esp
		popl %ebp
		ret
	.Lerror:
		xorl %eax, %eax
		jmp .Lquit
