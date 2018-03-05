.text
	.globl _start
	_start:
		pushl $1
		call syscall_exit
