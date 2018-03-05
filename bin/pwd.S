#include <std.h>
#define BUF -1024

.text
	.globl _start
	_start:
		movl %esp, %ebp

		subl $-BUF, %esp

		pushl $-BUF
		leal BUF(%ebp), %eax
		pushl %eax
		call syscall_getcwd
		addl $8, %esp

		cmpl $0, %eax
		jl .Lerror

		leal BUF(%ebp), %eax
		push %eax
		call puts
		addl $4, %esp

		cmpl $0, %eax
		jl .Lerror
	.Lquit:
		pushl $EXIT_SUCCESS
		call syscall_exit
	.Lerror:
		pushl ARGV(%ebp)
		call perror
		addl $4, %esp

		pushl $EXIT_FAILURE
		call syscall_exit

