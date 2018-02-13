.text
	.globl _start
	_start:
		movl %esp, %ebp

		movl $2, %edi
		addl (%ebp), %edi

		.Lloop:
			movl (%ebp, %edi, 4), %ebx

			cmpl $0, %ebx
			je .Lquit

			pushl %ebx
			call puts
			addl $4, %esp

			incl %edi

			jmp .Lloop
		.Lquit:
			pushl $0
			call exit
