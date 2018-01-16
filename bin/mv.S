#define ARGC 0
#define ARGV 4
#define SRC 8
#define DEST 12

.text
	.globl _start
	_start:
		movl %esp, %ebp

		cmpl $3, ARGC(%ebp)
		jne error

		pushl DEST(%ebp)
		pushl SRC(%ebp)
		call rename
		addl $8, %esp

		cmpl $0, %eax
		jl rename_error

		pushl $0
		call exit
	rename_error:
		pushl ARGV(%ebp)
		call perror
		addl $4, %esp
	error:
		pushl $1
		call exit
