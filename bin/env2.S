#include <std.h>
.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		xorl %edi, %edi
		movl ENV(%ebp), %ecx
	.Lloop:
		movl (%ecx, %edi, 4), %ebx

		cmpl $0, %ebx
		je .Lquit

		pushl %ebx
		call puts
		addl $4, %esp

		incl %edi

		jmp .Lloop
	.Lquit:
		movl $EXIT_SUCCESS, %eax
		movl %ebp, %esp
		popl %ebp
		ret
