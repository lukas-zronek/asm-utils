#int select(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);

#include <syscall.h>

#define ARG_COUNT 5

#define NFDS 8
#define READFDS 12
#define WRITEFDS 16
#define EXCEPTFDS 20
#define TIMEOUT 24

.text
	.globl select
	.type select, @function
	select:
		pushl %ebp
		movl %esp, %ebp

		pushl TIMEOUT(%ebp)
		pushl EXCEPTFDS(%ebp)
		pushl WRITEFDS(%ebp)
		pushl READFDS(%ebp)
		pushl NFDS(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_SELECT
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
