#include <io.h>

#define ARGC 0
#define ARGV 4
#define SECONDS 8
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

.data
	.L.usage:
		.asciz "usage: sleep seconds"
.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lprint_usage

		pushl SECONDS(%ebp)
		call atoi
		addl $4, %esp

		cmpl $0, %eax
		jl .Lerror

		pushl %eax
		call sleep
		addl $4, %esp

		cmpl $-1, %eax
		jne .Lquit

		pushl ARGV(%ebp)
		call perror
		addl $4, %esp

		jmp .Lerror

		.Lquit:
			pushl $EXIT_SUCCESS
			call exit
		.Lprint_usage:
			push $.L.usage
			push $STDERR_FILENO
			call fputs
			addl $8, %esp
		.Lerror:
			pushl $EXIT_FAILURE
			call exit
