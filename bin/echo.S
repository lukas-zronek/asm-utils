#include <std.h>
#include <io.h>
.rodata
	.L.newline:
		.asciz "\n"
	.L.space:
		.asciz " "
.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		cmpl $1, ARGC(%ebp)
		je .Lquit

		movl $1, %edi
		movl ARGV(%ebp), %ebx
	.Lloop_start:
		cmpl ARGC(%ebp), %edi
		je .Lloop_exit

		pushl (%ebx, %edi, 4)
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp

		incl %edi

		pushl $.L.space
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp

		jmp .Lloop_start
	.Lloop_exit:
		pushl $.L.newline
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
	.Lquit:
		movl $EXIT_SUCCESS, %eax
		movl %ebp, %esp
		popl %ebp
		ret
