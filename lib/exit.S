#include <syscall.h>

#define ARG_1 8
#define ARG_2 12
#define ARG_3 16
#define ARG_4 20
#define ARG_5 24

.text
	.globl _exit
	_exit:
		pushl %ebp
		movl %esp, %ebp

		pushl ARG_5(%ebp)
		pushl ARG_4(%ebp)
		pushl ARG_3(%ebp)
		pushl ARG_2(%ebp)
		pushl ARG_1(%ebp)
		movl $1, %eax
		call .Lkernel

		jc .Lerror
		jmp .Lreturn
	.Lkernel:
		int $SYSCALL_VECTOR
		ret
	.Lerror:
		movl %eax, _errno
		movl $-1, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
