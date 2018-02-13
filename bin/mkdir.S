#define ARGC 0
#define ARGV 4
#define DIR 8

.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $2, ARGC(%ebp)
		jne .Lerror

		pushl $0755
		pushl DIR(%ebp)
		call mkdir
		addl $8, %esp

		cmpl $0, %eax
		jl .Lmkdir_error

		pushl $0
		call exit
	.Lmkdir_error:
		pushl DIR(%ebp)
		call perror
		addl $4, %esp
	.Lerror:
		pushl $1
		call exit
