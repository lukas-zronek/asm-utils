#include <std.h>
#include <io.h>

#define SECONDS 4

.rodata
	.L.usage:
		.asciz "usage: sleep seconds"
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lprint_usage

		movl ARGV(%ebp), %eax
		pushl SECONDS(%eax)
		call atoi
		addl $4, %esp

		cmpl $0, %eax
		jl .Lerror

		pushl %eax
		call sleep
		addl $4, %esp

		cmpl $-1, %eax
		jne .Lsuccess

		movl ARGV(%ebp), %eax
		pushl (%eax)
		call perror
		addl $4, %esp

		jmp .Lerror
	.Lsuccess:
		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lprint_usage:
		push $.L.usage
		push $STDERR_FILENO
		call fputs
		addl $8, %esp
	.Lerror:
		movl $EXIT_FAILURE, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
