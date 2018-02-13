#define BASE 8
#define POWER 12

.text
	.globl pow
	.type pow, @function
	pow:
		pushl %ebp
		movl %esp, %ebp

		pushl %edi
		pushl %ebx

		movl $1, %eax
		movl BASE(%ebp), %ebx
		movl POWER(%ebp), %edi

		.Lloop:
			cmpl $0, %edi
			je .Lquit

			mull %ebx

			decl %edi

			jmp .Lloop
		.Lquit: 
			popl %ebx
			popl %edi

			movl %ebp, %esp
			popl %ebp
			ret
