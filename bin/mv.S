#include <std.h>
#include <io.h>

#define PROG 0	/* argv[0] */
#define SRC 4	/* argv[1] */
#define DEST 8	/* argv[2] */

.rodata
	.L.usage:
		.asciz "usage: mv source target"
.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		cmpl $3, ARGC(%ebp)
		jne .Lprint_usage

		movl ARGV(%ebp), %ebx
		movl SRC(%ebx), %ecx
		movl DEST(%ebx), %edx

		pushl %edx
		pushl %ecx
		call syscall_rename
		addl $8, %esp

		cmpl $0, %eax
		jl .Lrename_error

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lrename_error:
		movl ARGV(%ebp), %eax
		pushl PROG(%eax)
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
