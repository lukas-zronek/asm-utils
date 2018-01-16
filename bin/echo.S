#include <io.h>
.data
	newline:
		.asciz "\n"
	space:
		.asciz " "
.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $1, (%ebp)
		je quit

		movl $2, %edi
	loop_start:
		cmpl (%ebp), %edi
		jg loop_exit

		pushl %edi
		pushl (%ebp, %edi, 4)
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
		popl %edi

		incl %edi

		pushl %edi
		pushl $space
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
		popl %edi

		jmp loop_start
	loop_exit:
		pushl $newline
		pushl $STDOUT_FILENO
		call fprint
		addl $8, %esp
	quit:
		pushl $0
		call exit
