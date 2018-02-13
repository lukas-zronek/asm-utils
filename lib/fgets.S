#include <io.h>

#define SIZE 12
#define STRING 8

.text
	.globl fgets
	.type fgets, @function
	fgets:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx

		pushl SIZE(%ebp)
		pushl STRING(%ebp)
		pushl $STDIN_FILENO
		call read
		addl $12, %esp

		pushl %eax

		pushl STRING(%ebp)
		call strlen
		addl $4, %esp

		decl %eax

		movl STRING(%ebp), %ebx
		movb $0, (%ebx, %eax, 1)

		popl %eax

		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
