#include <std.h>
#include <io.h>

#define DIR 8

.rodata
	.L.usage:
		.asciz "usage: mkdir directory_name"
.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lprint_usage

		pushl $0755
		pushl DIR(%ebp)
		call syscall_mkdir
		addl $8, %esp

		cmpl $0, %eax
		jl .Lmkdir_error

		pushl $EXIT_SUCCESS
		call syscall_exit
	.Lmkdir_error:
		pushl DIR(%ebp)
		call perror
		addl $4, %esp
	.Lerror:
		pushl $EXIT_FAILURE
		call syscall_exit
	.Lprint_usage:
		push $.L.usage
		push $STDERR_FILENO
		call fputs
		addl $8, %esp

		jmp .Lerror
