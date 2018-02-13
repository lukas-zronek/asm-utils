.text
	.globl _start
	_start:
		movl %esp, %ebp

		movl $2, %edi
		addl (%ebp), %edi

		.Lloop:
			movl (%ebp, %edi, 4), %eax

			cmpl $0, %eax
			je .Lquit

			pushl %edi
			pushl %eax
			pushl %eax
			call puts
			addl $4, %esp
			popl %eax
			popl %edi

			incl %edi

			jmp .Lloop
		.Lquit:
			pushl $0
			call exit
