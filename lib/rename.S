#int rename(const char *from, const char *to);

#include <syscall.h>

#define ARG_COUNT 2
#define FROM 8
#define TO 12

.text
	.globl rename
	.type rename, @function
	rename:
		pushl %ebp
		movl %esp, %ebp

		pushl TO(%ebp)
		pushl FROM(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_RENAME
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
