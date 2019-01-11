/*
 * int dputs(int fd, const char *s);
 *
 * This function writes the string pointed to by s to the given file descriptor
 */

#define FD 8
#define STRING 12

.rodata
	.L.newline:
		.asciz "\n"
.text
	.globl dputs
	.type dputs, @function
	dputs:
		pushl %ebp
		movl %esp, %ebp

		pushl STRING(%ebp)
		pushl FD(%ebp)
		call dprint
		addl $8, %esp

		pushl $.L.newline
		pushl FD(%ebp)
		call dprint

		movl %ebp, %esp
		popl %ebp
		ret
