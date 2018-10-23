#include <std.h>
#include <io.h>
#include <dir.h>

#define DIR -4

.rodata
	.L.cwd:
        	.asciz "."
.text
	.globl _main
	_main:
		pushl %ebp
		movl %esp, %ebp

		subl $-DIR, %esp

		cmpl $2, ARGC(%ebp)
		jl .Lnoarg

		movl $1, %eax
		movl ARGV(%ebp), %edi
		pushl (%edi, %eax, 4)
		jmp .Lopen_dir

	.Lnoarg:
		pushl $.L.cwd

	.Lopen_dir:
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
		movl $1, %eax
		movl ARGV(%ebp), %edi
		pushl (%edi, %eax, 4)
		call perror
		addl $4, %esp

		movl $EXIT_FAILURE, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
