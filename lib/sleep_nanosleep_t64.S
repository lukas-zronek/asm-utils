/*
 * int sleep(int seconds);
 *
 * This implementation uses the nanosleep syscall of OpenBSD >= 5.5 with 64-bit time_t:
 *
 *	int nanosleep(const struct timespec *rqtp, struct timespec *rmtp);
 *
 *	struct timespec {
 *		time_t  tv_sec;
 *		long    tv_nsec;
 *	};
 *
 *	typedef	__time_t time_t;
 *	typedef __int64_t __time_t;
 *	typedef	long long __int64_t;
 *
 */

#define SECONDS 8
#define TIMESPEC_SEC -12
#define TIMESPEC_NSEC -8

.text
	.globl sleep
	.type sleep, @function
	sleep:
		pushl %ebp
		movl %esp, %ebp

		subl $-TIMESPEC_SEC, %esp

		movl SECONDS(%ebp), %eax
		movl %eax, TIMESPEC_SEC(%ebp)
		movl $0, TIMESPEC_NSEC(%ebp)
		leal TIMESPEC_SEC(%ebp), %eax

		pushl $0
		pushl %eax
		call syscall_nanosleep
		addl $8, %esp

		movl %ebp, %esp
		popl %ebp
		ret
