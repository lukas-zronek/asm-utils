#int nanosleep(const struct timespec *rqtp, struct timespec *rmtp);

#include <syscall.h>

#define ARG_COUNT 2
#define RQTP 8
#define RMTP 12

.text
	.globl nanosleep
	.type nanosleep, @function
	nanosleep:
		pushl %ebp
		movl %esp, %ebp

		pushl RMTP(%ebp)
		pushl RQTP(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_NANOSLEEP
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
