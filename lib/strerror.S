# char *strerror(int errnum);

#define ERRNUM 8

.text
	.globl strerror
	.type strerror, @function
	strerror:
		pushl %ebp
		movl %esp, %ebp

		xorl %eax, %eax

		cmpl $0, ERRNUM(%ebp)
		jl return

		cmpl $sys_nerr, ERRNUM(%ebp)
		jge return

		movl ERRNUM(%ebp), %eax
	return:
		movl sys_errlist(, %eax, 4), %eax

		movl %ebp, %esp
		popl %ebp
		ret
