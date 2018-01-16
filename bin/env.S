.text
	.globl _start
	_start:
		movl %esp, %ebx
		movl (%esp), %eax
		imull $4, %eax
		addl %eax, %ebx
		addl $4, %ebx

		loop:
			addl $4, %ebx

			cmpl $0, (%ebx)
			je quit

			pushl %ebx
			pushl (%ebx)
			call puts
			addl $4, %esp
			popl %ebx

			jmp loop
		quit:
			pushl $0
			call exit
