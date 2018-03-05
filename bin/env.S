#include <std.h>
.text
	.globl _start
	_start:
		movl %esp, %ebx
		movl (%esp), %eax
		imull $4, %eax
		addl %eax, %ebx
		addl $4, %ebx
	.Lloop:
		addl $4, %ebx

		cmpl $0, (%ebx)
		je .Lquit

		pushl (%ebx)
		call puts
		addl $4, %esp

		jmp .Lloop
	.Lquit:
		pushl $EXIT_SUCCESS
		call syscall_exit
