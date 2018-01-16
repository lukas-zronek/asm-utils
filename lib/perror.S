# void perror(const char *string);

#include <io.h>

#define STRING 8

.data
	seperator:
		.asciz ": "
.text
	.globl perror
	.type perror, @function
	perror:
		pushl %ebp
		movl %esp, %ebp

		pushl STRING(%ebp)
		pushl $STDERR_FILENO
		call fprint
		addl $8, %esp

		pushl $seperator
		pushl $STDERR_FILENO
		call fprint
		addl $8, %esp

		pushl _errno
		call strerror
		addl $4, %esp

		pushl %eax
		pushl $STDERR_FILENO
		call fputs
		addl $8, %esp

		movl %ebp, %esp
		popl %ebp
		ret
