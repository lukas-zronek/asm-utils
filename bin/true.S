.text
	.globl _start
	_start:
		pushl $0
		call syscall_exit
