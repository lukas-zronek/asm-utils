#include <std.h>
#include <io.h>
.data
	.L.newline:
		.asciz "\n"
	.L.space:
		.asciz " "
.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $1, (%ebp)
		je .Lquit

		movl $2, %edi
	.Lloop_start:
		cmpl (%ebp), %edi
		jg .Lloop_exit

		pushl (%ebp, %edi, 4)
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
		pushl $EXIT_SUCCESS
		call exit
