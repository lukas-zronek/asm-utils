/*
 * C startup code for i386
 *
 * The kernel is expected to set up the stack as follows:
 *
 *  higher adresses |      ...      |
 *                  + - - - - - - - +
 *                  |       0       |
 *                  + - - - - - - - +
 *                  |    &env[n]    |
 *                  + - - - - - - - +
 *                  |      ...      |
 *                  + - - - - - - - +
 *                  |    &env[0]    |      esp + argc * 4 + 1
 *                  + - - - - - - - +
 *                  |       0       |
 *                  + - - - - - - - +
 *                  | &argv[argc-1] |
 *                  + - - - - - - - +
 *                  |      ...      |
 *                  + - - - - - - - +
 *                  |    &argv[0]   |      esp + 4
 *                  + - - - - - - - +
 *                  |     argc      |   <- esp
 *  lower adresses  + - - - - - - - +
 *
 * After running the c startup code, the stack looks like this:
 *
 *  higher adresses |      ...      |
 *                  + - - - - - - - +
 *                  |    &env[0]    |
 *                  + - - - - - - - +
 *                  |    &argv[0]   |
 *                  + - - - - - - - +
 *                  |     argc      |   <- %esp
 *  lower adresses  + - - - - - - - +
 *
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
		/* %eax = %ecx * %eax */
		mull %ecx
		addl %ebx, %eax

		pushl %eax
		pushl %ebx
		pushl ARGC(%ebp)
		
		call main

		pushl %eax
		call syscall_exit
