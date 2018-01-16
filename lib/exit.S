# void exit(int status);

#include <syscall.h>

#define STATUS 8
#define ARG_COUNT 1

.text
	.globl exit
	.type exit, @function
	exit:
		pushl %ebp
		movl %esp, %ebp

		pushl STATUS(%ebp)
		pushl $ARG_COUNT
		pushl $SYS_EXIT
		call syscall
		
		# should never be reached
		movl %ebp, %esp
		popl %ebp
		ret
