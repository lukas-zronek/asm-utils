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

		pushl %edi
		pushl (%ebp, %edi, 4)
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
		popl %edi

		incl %edi

		pushl %edi
		pushl $.L.space
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
		popl %edi

		jmp .Lloop_start
	.Lloop_exit:
		pushl $.L.newline
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
	.Lquit:
		pushl $0
		call exit
