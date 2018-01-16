# int open(const char *path, int flags, ...);

#include <syscall.h>

#define PATHNAME 8
#define FLAGS 12
#define MODE 16
#define ARG_COUNT 3

.text
	.globl open
	.type open, @function
	open:
		pushl %ebp
		movl %esp, %ebp

		pushl MODE(%ebp)
		pushl FLAGS(%ebp)
		pushl PATHNAME(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_OPEN
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
