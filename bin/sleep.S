#include <io.h>

#define ARGC 0
#define ARGV 4
#define SECONDS 8
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

.data
	usage:
		.asciz "usage: sleep seconds"
.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne print_usage

		pushl SECONDS(%ebp)
		call atoi
		addl $4, %esp

		cmpl $0, %eax
		jl error

		pushl %eax
		call sleep
		addl $4, %esp

		cmpl $-1, %eax
		jne quit

		pushl ARGV(%ebp)
		call perror
		addl $4, %esp

		jmp error

		quit:
			pushl $EXIT_SUCCESS
			call exit
		print_usage:
			push $usage
			push $STDERR_FILENO
			call fputs
			addl $8, %esp
		error:
			pushl $EXIT_FAILURE
			call exit
