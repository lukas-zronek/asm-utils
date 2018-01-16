# int close(int fd);

#include <syscall.h>

#define FD 8
#define ARG_COUNT 1

.text
	.globl close
	.type close, @function
	close:
		pushl %ebp
		movl %esp, %ebp

		pushl FD(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_CLOSE
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
