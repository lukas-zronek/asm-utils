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

		loop:
			push 12(%ebp, %edi, 4)
			decl %edi
			cmpl $0, %edi
			jg loop
		movl SYS_NR(%ebp), %eax
		call kernel

		jc error
		jmp return
	error:
		movl %eax, _errno
		movl $-1, %eax
	return:
		movl %ebp, %esp
		popl %ebp
		ret
kernel:
	int $SYSCALL_VECTOR
        ret
