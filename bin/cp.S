#include <std.h>
#include <io.h>

.rodata
	.L.usage:
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
		jl .Lprint_usage

		pushl $0
		pushl $O_RDONLY
		pushl SRC(%ebp)
		call syscall_open
		addl $12, %esp

		cmpl $-1, %eax
		je .Lerror

		movl %eax, FD_SRC(%ebp)

		movl $O_WRONLY, %eax
		orl $O_CREAT, %eax
		orl $O_EXCL, %eax

		pushl $0666
		pushl %eax
		pushl DEST(%ebp)
		call syscall_open
		addl $12, %esp

		movl %eax, FD_DEST(%ebp)

		cmpl $-1, %eax
		je .Lerror
	.Lloop_start:
		leal BUFFER(%ebp), %ebx
		pushl $BUFFER_SIZE
		pushl %ebx
		pushl FD_SRC(%ebp)
		call syscall_read
		addl $12, %esp

		cmpl $-1, %eax
		je .Lerror

		cmpl $0, %eax
		jle .Lloop_end

		movl FD_DEST(%ebp), %ecx
			
		leal BUFFER(%ebp), %ebx
		pushl %eax
		pushl %ebx
		pushl %ecx
		call syscall_write
		addl $12, %esp

		cmpl $-1, %eax
		je .Lerror

		jmp .Lloop_start
	.Lloop_end:
		pushl FD_SRC(%ebp)
		call syscall_close
		addl $4, %esp

		pushl FD_DEST(%ebp)
		call syscall_close
		addl $4, %esp

		jmp .Lquit
	.Lerror:
		pushl 4(%ebp)
		call perror
		addl $4, %esp

		pushl $EXIT_FAILURE
		call syscall_exit
	.Lprint_usage:
		push $.L.usage
		push $STDERR_FILENO
		call fputs
		addl $8, %esp

		pushl $EXIT_FAILURE
		call syscall_exit
	.Lquit:
		pushl $EXIT_SUCCESS
		call syscall_exit
