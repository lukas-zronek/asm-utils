.text
	.globl _start
	_start:
		movl %esp, %ebp

		movl $2, %edi
		addl (%ebp), %edi

		loop:
			movl (%ebp, %edi, 4), %eax

			cmpl $0, %eax
			je quit

			pushl %edi
			pushl %eax
			pushl %eax
			call puts
			addl $4, %esp
			popl %eax
			popl %edi

			incl %edi

			jmp loop
		quit:
			pushl $0
			call exit
