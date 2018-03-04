# int sleep(int seconds);

#define SECONDS 8
#define TIMESPEC_SEC -8
#define TIMESPEC_NSEC -4

.text
	.globl sleep
	.type sleep, @function
	sleep:
		pushl %ebp
		movl %esp, %ebp

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

		movl %ebp, %esp
		popl %ebp
		ret
