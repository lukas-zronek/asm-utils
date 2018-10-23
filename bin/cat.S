#include <std.h>
#include <io.h>

.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		movl $1, %edi

		cmpl $1, ARGC(%ebp)
		jg .Lloop

		pushl $0
		call .Lcat
		addl $4, %esp
	
		cmpl $1, %eax
		je .Lerror
		jmp .Lsuccess
		movl ARGV(%ebp), %ebx
	.Lloop:
		cmpl ARGC(%ebp), %edi
		je .Lsuccess

		pushl (%ebx, %edi, 4)
		call .Lcat
		addl $4, %esp

		cmpl $EXIT_FAILURE, %eax
		je .Lerror

		incl %edi

		jmp .Lloop
	.Lerror:
		movl $EXIT_FAILURE, %eax
		jmp .Lreturn
	.Lsuccess:
		movl $EXIT_SUCCESS, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
#define FILENAME 8
#define FD -4
#define RETURN -8
	.type .Lcat, @function
	.Lcat:
		pushl %ebp
		movl %esp, %ebp

		subl $-RETURN, %esp

		pushl %edi

		movl $EXIT_SUCCESS, RETURN(%ebp)

		movl $STDIN_FILENO, FD(%ebp)
		cmpl $0, FILENAME(%ebp)
		je .Lcat_copyfile

		pushl $0
		pushl $O_RDONLY
		pushl FILENAME(%ebp)
		call syscall_open
		addl $12, %esp

		cmpl $-1, %eax
		je .Lcat_error

		movl %eax, FD(%ebp)
	.Lcat_copyfile:
		pushl $STDOUT_FILENO
		pushl FD(%ebp)
		call copyfile
		addl $8, %esp

		cmpl $0, %eax
		je .Lcat_cleanup
	.Lcat_error:
		movl $EXIT_FAILURE, RETURN(%ebp)

		pushl FILENAME(%ebp)
		call perror
		addl $4, %esp
	.Lcat_cleanup:
		cmpl $STDIN_FILENO, FD(%ebp)
		jle .Lcat_return

		pushl FD(%ebp)
		call syscall_close
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
