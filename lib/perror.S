# void perror(const char *string);

#include <io.h>

#define STRING 8

.data
	.L.format:
		.asciz "%s: %s\n"
.text
	.globl perror
	.type perror, @function
	perror:
		pushl %ebp
		movl %esp, %ebp

		pushl _errno
		call strerror
		addl $4, %esp

		pushl %eax
		pushl STRING(%ebp)
		pushl $.L.format
		pushl $STDERR_FILENO
		call fprintf

		movl %ebp, %esp
		popl %ebp
		ret
