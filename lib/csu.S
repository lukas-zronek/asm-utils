/*
 * C runtime stack setup
 */
#define ARGC 0
#define ARGV 4

.text
	.globl _start
	_start:
		movl %esp, %ebp

		movl ARGC(%ebp), %eax
		leal ARGV(%ebp), %ebx

		/* calculate address of env[0]: */
		addl $1, %eax
		movl $4, %ecx
		# %eax = %ecx * %eax
		mull %ecx
		addl %ebx, %eax

		pushl %eax
		pushl %ebx
		pushl ARGC(%ebp)
		
		call _main

		pushl %eax
		call syscall_exit
