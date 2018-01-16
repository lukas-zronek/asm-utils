#define STRING 12
#define FD 8

.text
	.globl fprint
	.type fprint, @function
	fprint:
		pushl %ebp
		movl %esp, %ebp

		pushl STRING(%ebp)
		call strlen
		addl $4, %esp

		pushl %eax
		pushl STRING(%ebp)
		pushl FD(%ebp)
		call write
		addl $12, %esp

		movl %ebp, %esp
		popl %ebp
		ret
