#include <io.h>

#define ARGC 0
#define ARGV 4
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

.text
	.globl _start
	_start:
		movl %esp, %ebp

		movl $1, %edi

		cmpl $1, ARGC(%ebp)
		jg loop

		pushl $0
		call cat
		addl $4, %esp
	
		cmpl $1, %eax
		je error
		jmp quit

		loop:
			cmpl ARGC(%ebp), %edi
			jge quit

			pushl %edi

			pushl ARGV(%ebp, %edi, 4)
			call cat
			addl $4, %esp

			popl %edi

			cmpl $EXIT_FAILURE, %eax
			je error

			incl %edi

			jmp loop
		error:
			pushl $EXIT_FAILURE
			call exit
		quit:
			pushl $EXIT_SUCCESS
			call exit
#define BUFFER_SIZE 1024
#define FILENAME 8
#define FD -4
#define RETURN -8
#define BUFFER -1032
	cat:
		pushl %ebp
		movl %esp, %ebp

		subl $-BUFFER, %esp

		movl $EXIT_SUCCESS, RETURN(%ebp)

		movl $STDIN_FILENO, FD(%ebp)
		cmpl $0, FILENAME(%ebp)
		je cat_loop_start

		pushl $0
		pushl $O_RDONLY
		pushl FILENAME(%ebp)
		call open
		addl $12, %esp

		cmpl $-1, %eax
		je cat_error

		movl %eax, FD(%ebp)

		cat_loop_start:
        		leal BUFFER(%ebp), %eax
			pushl $BUFFER_SIZE
			pushl %eax
			pushl FD(%ebp)
			call read
			addl $12, %esp

			cmpl $0, %eax
			je cat_loop_end
			jl cat_error

			pushl %eax
        		leal BUFFER(%ebp), %eax
			pushl %eax
			pushl $1
			call write
			addl $12, %esp

			cmpl $-1, %eax
			je cat_error

			jmp cat_loop_start
		cat_error:
			movl $EXIT_FAILURE, RETURN(%ebp)

			pushl FILENAME(%ebp)
			call perror
			addl $4, %esp
		cat_loop_end:
			cmpl $STDIN_FILENO, FD(%ebp)
			jle cat_return

			pushl FD(%ebp)
			call close
			addl $4, %esp

			cmpl $0, %eax
			je cat_return

			movl $EXIT_FAILURE, RETURN(%ebp)

			pushl FILENAME(%ebp)
			call perror
			addl $4, %esp
		cat_return:
			movl RETURN(%ebp), %eax
			movl %ebp, %esp
			popl %ebp
			ret
