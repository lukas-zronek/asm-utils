#define ARGC 0
#define ARGV 4
#define SRC 8
#define DEST 12

.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $3, ARGC(%ebp)
		jne .Lerror

		pushl DEST(%ebp)
		pushl SRC(%ebp)
		call rename
		addl $8, %esp

		cmpl $0, %eax
		jl .Lrename_error

		pushl $0
		call exit
	.Lrename_error:
		pushl ARGV(%ebp)
		call perror
		addl $4, %esp
	.Lerror:
		pushl $1
		call exit
