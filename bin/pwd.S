#include <std.h>
#define BUF -1024

.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		subl $-BUF, %esp

		pushl $-BUF
		leal BUF(%ebp), %eax
		pushl %eax
		call getcwd
		addl $8, %esp

		cmpl $0, %eax
		je .Lerror

		leal BUF(%ebp), %eax
		push %eax
		call puts
		addl $4, %esp

		cmpl $0, %eax
		jl .Lerror

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lerror:
		movl ARGV(%ebp), %eax
		pushl (%eax)
		call perror
		addl $4, %esp

		movl $EXIT_FAILURE, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret

