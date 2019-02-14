/*
 * The wc utility displays the number of lines and bytes contained in the
 * input file
 */
#include <std.h>
#include <io.h>

#define ASCII_NEWLINE_SIGN 10

#define BUFFER_SIZE 1024
#define BUFFER -1028
#define FD -4

.rodata
	.L.usage:
		.asciz "usage: wc file"
	.Loutput:
		.asciz "\t%d\t%d\t%s\n"
.text
	.globl main
	main:
		pushl %ebp
		movl %esp, %ebp

		subl $-BUFFER, %esp

		pushl %edi
		pushl %ebx
		pushl %ecx
		pushl %esi

		cmpl $2, ARGC(%ebp)
		jne .Lprint_usage

		movl ARGV(%ebp), %eax

		pushl $0
		pushl $O_RDONLY
		pushl 4(%eax)
		call syscall_open
		addl $12, %esp

		cmpl $-1, %eax
		je .Lprint_error

		movl %eax, FD(%ebp)

		xorl %ecx, %ecx /* newline count */
		xorl %esi, %esi /* byte count */
	.Lread_loop:
		leal BUFFER(%ebp), %eax
		pushl $BUFFER_SIZE
		pushl %eax
		pushl FD(%ebp)
		call syscall_read
		addl $12, %esp

		cmpl $0, %eax
		je .Lprint_output
		jl .Lprint_error

		addl %eax, %esi

		xorl %edi, %edi /* buffer index */
	.Lbuffer_loop:
		cmpl $0, %eax
		jle .Lread_loop

		xorl %ebx, %ebx
		movb BUFFER(%ebp, %edi, 1), %bl

		decl %eax
		incl %edi

		cmpb $ASCII_NEWLINE_SIGN, %bl
		jne .Lbuffer_loop

		incl %ecx
		jmp .Lbuffer_loop
	.Lprint_output:
		movl ARGV(%ebp), %eax

		pushl 4(%eax)
		pushl %esi
		pushl %ecx
		pushl $.Loutput
		pushl $STDIN_FILENO
		call dprintf
		addl $20, %esp

		jmp .Lexit_success
	.Lprint_error:
		movl ARGV(%ebp), %eax
		pushl 4(%eax)
		call perror
		addl $4, %esp

		jmp .Lexit_error
	.Lprint_usage:
		push $.L.usage
		push $STDERR_FILENO
		call dputs
		addl $8, %esp
	.Lexit_error:
		movl $1, %eax
		jmp .Lreturn
	.Lexit_success:
		xorl %eax, %eax
	.Lreturn:
		popl %esi
		popl %ecx
		popl %ebx
		popl %edi

		movl %ebp, %esp
		popl %ebp
		ret
