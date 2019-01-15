#include <std.h>
#include <io.h>

#define FILE 4	/* argv[1] */

.rodata
	.L.usage:
		.asciz "usage: unlink file"
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lprint_usage

		movl ARGV(%ebp), %ebx
		movl FILE(%ebx), %ecx

		pushl %ecx
		call syscall_unlink
		addl $8, %esp

		cmpl $0, %eax
		jl .Lunlink_error

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lunlink_error:
		movl ARGV(%ebp), %eax
		pushl (%eax)
		call perror
		addl $4, %esp
		jmp .Lerror
	.Lprint_usage:
		push $.L.usage
		push $STDERR_FILENO
		call dputs
		addl $8, %esp
	.Lerror:
		movl $EXIT_FAILURE, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
