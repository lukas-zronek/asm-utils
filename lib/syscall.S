#include <syscall.h>

#define SYS_NR 8
#define ARG_COUNT 12

.text
	.globl syscall
	.type syscall, @function
	syscall:
		pushl %ebp
		movl %esp, %ebp

		movl ARG_COUNT(%ebp), %edi

		.Lloop:
			push 12(%ebp, %edi, 4)
			decl %edi
			cmpl $0, %edi
			jg .Lloop
		movl SYS_NR(%ebp), %eax
		call .Lkernel

		jc .Lerror
		jmp .Lreturn
	.Lerror:
		movl %eax, _errno
		movl $-1, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
.Lkernel:
	int $SYSCALL_VECTOR
        ret
