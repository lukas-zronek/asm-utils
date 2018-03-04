#include <std.h>
#include <io.h>

.text
	.globl _start
	_start:
		movl %esp, %ebp

		movl $1, %edi

		cmpl $1, ARGC(%ebp)
		jg .Lloop

		pushl $0
		call .Lcat
		addl $4, %esp
	
		cmpl $1, %eax
		je .Lerror
		jmp .Lquit
	.Lloop:
		cmpl ARGC(%ebp), %edi
		jge .Lquit

		pushl ARGV(%ebp, %edi, 4)
		call .Lcat
		addl $4, %esp

		cmpl $EXIT_FAILURE, %eax
		je .Lerror

		incl %edi

		jmp .Lloop
	.Lerror:
		pushl $EXIT_FAILURE
		call exit
	.Lquit:
		pushl $EXIT_SUCCESS
		call exit
#define BUFFER_SIZE 1024
#define FILENAME 8
#define FD -4
#define RETURN -8
#define BUFFER -1032
	.Lcat:
		pushl %ebp
		movl %esp, %ebp

		subl $-BUFFER, %esp

		pushl %edi

		movl $EXIT_SUCCESS, RETURN(%ebp)

		movl $STDIN_FILENO, FD(%ebp)
		cmpl $0, FILENAME(%ebp)
		je .Lcat_loop_start

		pushl $0
		pushl $O_RDONLY
		pushl FILENAME(%ebp)
		call open
		addl $12, %esp

		cmpl $-1, %eax
		je .Lcat_error

		movl %eax, FD(%ebp)
	.Lcat_loop_start:
		leal BUFFER(%ebp), %eax
		pushl $BUFFER_SIZE
		pushl %eax
		pushl FD(%ebp)
		call read
		addl $12, %esp

		cmpl $0, %eax
		je .Lcat_loop_end
		jl .Lcat_error

		pushl %eax
		leal BUFFER(%ebp), %eax
		pushl %eax
		pushl $1
		call write
		addl $12, %esp

		cmpl $-1, %eax
		je .Lcat_error

		jmp .Lcat_loop_start
	.Lcat_error:
		movl $EXIT_FAILURE, RETURN(%ebp)

		pushl FILENAME(%ebp)
		call perror
		addl $4, %esp
	.Lcat_loop_end:
		cmpl $STDIN_FILENO, FD(%ebp)
		jle .Lcat_return

		pushl FD(%ebp)
		call close
		addl $4, %esp

		cmpl $0, %eax
		je .Lcat_return

		movl $EXIT_FAILURE, RETURN(%ebp)

		pushl FILENAME(%ebp)
		call perror
		addl $4, %esp
	.Lcat_return:
		popl %edi

		movl RETURN(%ebp), %eax
		movl %ebp, %esp
		popl %ebp
		ret
