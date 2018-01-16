#int mkdir(const char *path, mode_t mode);

#include <syscall.h>

#define ARG_COUNT 2
#define PATH 8
#define MODE 12

.text
	.globl mkdir
	.type mkdir, @function
	mkdir:
		pushl %ebp
		movl %esp, %ebp

		pushl MODE(%ebp)
		pushl PATH(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_MKDIR
		call syscall

		movl %ebp, %esp
		popl %ebp
		ret
