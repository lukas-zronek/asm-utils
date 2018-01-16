# int puts(const char *string);

#include <io.h>

#define STRING 8

.text
	.globl puts
	.type puts, @function
	puts:
		pushl %ebp
		movl %esp, %ebp

		pushl STRING(%ebp)
		pushl $STDOUT_FILENO
		call fputs
		addl $4, %esp

		movl %ebp, %esp
		popl %ebp
		ret
