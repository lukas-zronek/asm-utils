#include <std.h>
.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		movl ENV(%ebp), %ebx
	.Lloop:
		cmpl $0, (%ebx)
		je .Lquit

		pushl (%ebx)
		call puts
		addl $4, %esp

		addl $4, %ebx

		jmp .Lloop
	.Lquit:
		movl $EXIT_SUCCESS, %eax
		movl %ebp, %esp
		popl %ebp
		ret
