# int sleep(int seconds);

#define SECONDS 8

.text
	.globl sleep
	.type sleep, @function
	sleep:
		pushl %ebp
		movl %esp, %ebp

#ifndef __APPLE__
#define TIMESPEC_SEC -8
#define TIMESPEC_NSEC -4
		subl $-TIMESPEC_SEC, %esp

		/*
		/usr/include/sys/_timespec.h:
		struct timespec {
		   time_t  tv_sec;
		   long    tv_nsec;
		};

		/usr/include/sys/types.h:
		typedef	__time_t time_t;

		/usr/include/x86/_types.h:
		typedef __int32_t __time_t;
		typedef	int       __int32_t;
		*/

		movl SECONDS(%ebp), %eax
		movl %eax, TIMESPEC_SEC(%ebp)
		movl $0, TIMESPEC_NSEC(%ebp)
		leal TIMESPEC_SEC(%ebp), %eax

		pushl $0
		pushl %eax
		call nanosleep
		addl $8, %esp
#else
#define TIMEVAL_SEC -8
#define TIMEVAL_USEC -4
		subl $-TIMEVAL_SEC, %esp

		/*
		struct timeval {
			time_t		tv_sec;  # seconds
			suseconds_t	tv_usec; # microseconds
		};
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
		call select
		addl $20, %esp
#endif
		movl %ebp, %esp
		popl %ebp
		ret
