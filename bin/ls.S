#include <std.h>
#include <io.h>
#include <dir.h>

#define DIR -4
#define CWD -8

.rodata
	.L.cwd:
        	.asciz "."
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		subl $-CWD, %esp

		cmpl $2, ARGC(%ebp)
		jl .Lnoarg

		movl $1, %eax
		movl ARGV(%ebp), %edi
		movl (%edi, %eax, 4), %ebx
		movl %ebx, CWD(%ebp)

		jmp .Lopen_dir
	.Lnoarg:
		movl $.L.cwd, CWD(%ebp)
	.Lopen_dir:
		pushl CWD(%ebp)
		call opendir
		addl $4, %esp

		movl %eax, DIR(%ebp)

		cmpl $0, %eax
		je .Lerror
	.Lloop:
		pushl DIR(%ebp)
		call readdir
		addl $4, %esp

		cmpl $0, %eax
		je .Lquit

		pushl %eax
		call puts
		addl $4, %esp

		jmp .Lloop
	.Lquit:
		movl DIR(%ebp), %eax
		pushl DIR_FD(%eax)
		call syscall_close
		addl $4, %esp

		cmpl $-1, %eax
		je .Lerror

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lerror:
		pushl CWD(%ebp)
		call perror
		addl $4, %esp

		movl $EXIT_FAILURE, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
