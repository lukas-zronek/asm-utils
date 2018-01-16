#define BASE 8
#define POWER 12

.text
	.globl pow
	.type pow, @function
	pow:
		pushl %ebp
		movl %esp, %ebp

		movl $1, %eax
		movl BASE(%esp), %ebx
		movl POWER(%esp), %edi

		loop:
			cmpl $0, %edi
			je quit

			mull %ebx

			decl %edi

			jmp loop
		quit: 
			movl %ebp, %esp
			popl %ebp
			ret
