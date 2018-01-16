# ssize_t write(int fd, const void *buf, size_t nbytes);

#include <syscall.h>

#define FD 8
#define BUF 12
#define NBYTES 16
#define ARG_COUNT 3

.text
	.globl write
	.type write, @function
	write:
		pushl %ebp
		movl %esp, %ebp

		pushl NBYTES(%ebp)
		pushl BUF(%ebp)
		pushl FD(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_WRITE
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
