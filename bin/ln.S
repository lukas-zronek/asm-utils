#include <std.h>
#include <io.h>

#define ASCII_MINUS 45
#define ASCII_S 115

.rodata
	.L.usage:
		.asciz "usage: ln [-s] source target"
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx
		pushl %ecx
		pushl %edx
		pushl %edi

		cmpl $3, ARGC(%ebp)
		jl .Lprint_usage

		movl $syscall_link, %edx

		movl $1, %edi

		movl ARGV(%ebp), %eax
		movl 4(%eax), %eax

		movb (%eax), %bl
		cmpb $ASCII_MINUS, %bl
		jne .Llink

		movb 1(%eax), %bl
		cmpb $ASCII_S, %bl
		jne .Lprint_usage

		movb 2(%eax), %bl
		cmpb $0, %bl
		jne .Lprint_usage

		incl %edi
		movl $syscall_symlink, %edx
	.Llink:
		movl %edi, %ebx
		incl %ebx
		incl %ebx
		cmpl %ebx, ARGC(%ebp)
		jne .Lprint_usage

		movl ARGV(%ebp), %eax
		movl (%eax, %edi, 4), %ebx
		incl %edi
		movl (%eax, %edi, 4), %ecx

		pushl %ecx
		pushl %ebx
		call *%edx
		addl $8, %esp

		cmpl $0, %eax
		jl .Llink_error

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Llink_error:
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
		popl %edi
		popl %edx
		popl %ecx
		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
