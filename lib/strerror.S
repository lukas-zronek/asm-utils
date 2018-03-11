# char *strerror(int errnum);

#define ERRNUM 8

.text
	.globl strerror
	.type strerror, @function
	strerror:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx

		xorl %eax, %eax

		cmpl $0, ERRNUM(%ebp)
		jl .Lreturn

		movl sys_nerr, %ebx
		cmpl %ebx, ERRNUM(%ebp)
		jge .Lreturn

		movl ERRNUM(%ebp), %eax
	.Lreturn:
		movl sys_errlist(, %eax, 4), %eax

		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
