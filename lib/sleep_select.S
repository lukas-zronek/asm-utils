# int sleep(int seconds);

#define SECONDS 8

#define TIMEVAL_SEC -8
#define TIMEVAL_USEC -4

.text
	.globl sleep
	.type sleep, @function
	sleep:
		pushl %ebp
		movl %esp, %ebp

		subl $-TIMEVAL_SEC, %esp

		/*
		 * struct timeval {
		 * 	time_t		tv_sec;  # seconds
		 * 	suseconds_t	tv_usec; # microseconds
		 * };
		 */

		movl SECONDS(%ebp), %eax
		movl %eax, TIMEVAL_SEC(%ebp)
		movl $0, TIMEVAL_USEC(%ebp)
		leal TIMEVAL_SEC(%ebp), %eax

		pushl %eax
		pushl $0
		pushl $0
		pushl $0
		pushl $0
		call syscall_select
		addl $20, %esp

		movl %ebp, %esp
		popl %ebp
		ret
