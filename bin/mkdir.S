#include <std.h>
#define DIR 8

.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lerror

		pushl $0755
		pushl DIR(%ebp)
		call mkdir
		addl $8, %esp

		cmpl $0, %eax
		jl .Lmkdir_error

		pushl $EXIT_SUCCESS
		call exit
	.Lmkdir_error:
		pushl DIR(%ebp)
		call perror
		addl $4, %esp
	.Lerror:
		pushl $EXIT_FAILURE
		call exit
