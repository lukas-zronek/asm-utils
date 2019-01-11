/*
 * char *gets_s(char *s, int size);
 *
 * This function reads at most one character less than the number of characters
 * specified by the size from the specified file descriptor and stores them in
 * the string s. If an error occurs, it returns 0.
 */

#include <io.h>

#define SIZE 12
#define STRING 8

#define ASCII_NEWLINE 10

.text
	.globl gets_s
	.type gets_s, @function
	gets_s:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx
		pushl %ecx
		pushl %edx
		pushl %edi

		movl STRING(%ebp), %ebx
		movl SIZE(%ebp), %ecx
		xorl %edi, %edi
	.Lread_loop:
		cmpl $0, %ecx
		jle .Lread_end

		leal (%ebx, %edi, 1), %eax

		pushl $1
		pushl %eax
		pushl $STDIN_FILENO
		call syscall_read
		addl $12, %esp

		cmpl $0, %eax
		jl .Lerror

		xorl %edx, %edx
		movb (%ebx, %edi, 1), %dl

		cmpb $ASCII_NEWLINE, %dl
		je .Lread_end

		decl %ecx
		incl %edi

		jmp .Lread_loop
	.Lread_end:
		movb $0, (%ebx, %edi, 1)

		movl STRING(%ebp), %eax
		jmp .Lreturn
	.Lerror:
		movl $0, %eax
	.Lreturn:
		popl %edi
		popl %edx
		popl %ecx
		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
