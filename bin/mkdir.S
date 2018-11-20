#include <std.h>
#include <io.h>

#define DIR 4

.rodata
	.L.usage:
		.asciz "usage: mkdir directory_name"
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lprint_usage

		pushl $0755
		movl ARGV(%ebp), %eax
		pushl DIR(%eax)
		call syscall_mkdir
		addl $8, %esp

		cmpl $0, %eax
		jl .Lmkdir_error

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lmkdir_error:
		movl ARGV(%ebp), %eax
		pushl DIR(%eax)
		call perror
		addl $4, %esp
		jmp .Lerror
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
