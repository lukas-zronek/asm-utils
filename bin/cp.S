#include <io.h>

.data
	usage:
		.asciz "usage: cp source_file target_file"
.text
#define BUFFER_SIZE 1024
#define SRC 8
#define DEST 12
#define FD_SRC -4
#define FD_DEST -8
#define BUFFER -1032
	.globl _start
	_start:
		movl %esp, %ebp

		subl $-BUFFER, %esp

		cmpl $3, (%ebp)
		jl print_usage

		pushl $0
		pushl $O_RDONLY
		pushl SRC(%ebp)
		call open
		addl $12, %esp

		cmpl $-1, %eax
		je error

		movl %eax, FD_SRC(%ebp)

		movl $O_WRONLY, %eax
		orl $O_CREAT, %eax
		orl $O_EXCL, %eax

		pushl $0666
		pushl %eax
		pushl DEST(%ebp)
		call open
		addl $12, %esp

		movl %eax, FD_DEST(%ebp)

		cmpl $-1, %eax
		je error

		loop_start:
        		leal BUFFER(%ebp), %ebx
			pushl $BUFFER_SIZE
			pushl %ebx
			pushl FD_SRC(%ebp)
			call read
			addl $12, %esp

			cmpl $-1, %eax
			je error

			cmpl $0, %eax
			jle loop_end

			movl FD_DEST(%ebp), %ecx
			
        		leal BUFFER(%ebp), %ebx
			pushl %eax
			pushl %ebx
			pushl %ecx
			call write
			addl $12, %esp

			cmpl $-1, %eax
			je error

			jmp loop_start
		loop_end:
			pushl FD_SRC(%ebp)
			call close
			addl $4, %esp

			pushl FD_DEST(%ebp)
			call close
			addl $4, %esp

			jmp quit
		error:
			pushl 4(%ebp)
			call perror
			addl $4, %esp

			pushl $1
			call exit
		print_usage:
			push $usage
			push $STDERR_FILENO
			call fputs
			addl $8, %esp

			pushl $1
			call exit
		quit:
			pushl $0
			call exit
