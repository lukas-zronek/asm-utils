/*
 * int sleep(int seconds);
 *
 * On macOS, sleep() is implemented with the select syscall, because xnu has
 * no sleep syscall and the clock_sleep mach trap would be harder to use.
 *
 *	int select(int nd, u_int32_t *in, u_int32_t *ou, u_int32_t *ex,
 *			struct timeval *tv)
 *
 *	struct timeval {
 *		time_t		tv_sec;  # seconds
 *		suseconds_t	tv_usec; # microseconds
 *	};
 *
 */

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
