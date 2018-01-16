# int getdirentries(int fd, char *buf, int nbytes, long *basep);

#include <syscall.h>

#define FD 8
#define BUF 12
#define NBYTES 16
#define BASEP 20
#define ARG_COUNT 4

.text
	.globl getdirentries
	.type getdirentries, @function
	getdirentries:
		pushl %ebp
		movl %esp, %ebp

		pushl BASEP(%ebp)
		pushl NBYTES(%ebp)
		pushl BUF(%ebp)
		pushl FD(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_GETDIRENTRIES
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
