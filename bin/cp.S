#include <std.h>
#include <io.h>

#define PROG 0	/* argv[0] */
#define SRC 4	/* argv[1] */
#define DEST 8	/* argv[2] */
#define FD_SRC -4
#define FD_DEST -8

.rodata
	.L.usage:
		.asciz "usage: cp source_file target_file"
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		subl $-FD_DEST, %esp

		cmpl $3, ARGC(%ebp)
		jl .Lprint_usage

		movl ARGV(%ebp), %eax
		movl SRC(%eax), %eax

		pushl $0
		pushl $O_RDONLY
		pushl %eax
		call syscall_open
		addl $12, %esp

		cmpl $-1, %eax
		je .Lprint_error

		movl %eax, FD_SRC(%ebp)

		movl $O_WRONLY, %eax
		orl $O_CREAT, %eax
		orl $O_EXCL, %eax

		movl ARGV(%ebp), %ebx
		movl DEST(%ebx), %ebx

		pushl $0666
		pushl %eax
		pushl %ebx
		call syscall_open
		addl $12, %esp

		movl %eax, FD_DEST(%ebp)

		cmpl $-1, %eax
		je .Lprint_error

		pushl FD_DEST(%ebp)
		pushl FD_SRC(%ebp)
		call copyfile
		addl $8, %esp

		cmpl $0, %eax
		jne .Lprint_error

		pushl FD_SRC(%ebp)
		call syscall_close
		addl $4, %esp

		cmpl $0, %eax
		jne .Lprint_error

		pushl FD_DEST(%ebp)
		call syscall_close
		addl $4, %esp

		cmpl $0, %eax
		jne .Lprint_error

		movl $EXIT_SUCCESS, %eax
		jmp .Lreturn
	.Lprint_error:
		movl ARGV(%ebp), %eax
		pushl PROG(%eax)
		call perror
		addl $4, %esp
		jmp .Lerror
	.Lprint_usage:
		push $.L.usage
		push $STDERR_FILENO
		call dputs
		addl $8, %esp
	.Lerror:
		movl $EXIT_FAILURE, %eax
	.Lreturn:
		movl %ebp, %esp
		popl %ebp
		ret
