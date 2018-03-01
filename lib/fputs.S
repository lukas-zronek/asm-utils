#define FD 8
#define STRING 12

.rodata
	.L.newline:
		.asciz "\n"
.text
	.globl fputs
	.type fputs, @function
	fputs:
		pushl %ebp
		movl %esp, %ebp

		pushl STRING(%ebp)
		pushl FD(%ebp)
		call fprint
		addl $8, %esp

		pushl $.L.newline
		pushl FD(%ebp)
		call fprint

		movl %ebp, %esp
		popl %ebp
		ret
