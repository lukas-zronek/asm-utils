#include <std.h>
#include <io.h>

#define SECONDS 8

.rodata
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
