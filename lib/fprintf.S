/*
 * int fprintf(int fd, const char * restrict format, ...);
 *
 * Supported arguments in the format string: %s, %d
 */

#include <std.h>
#include <io.h>

#define FD 8
#define FORMAT 12
/*
 * the biggest long number converted to a string may require a maximum of
 * 11 bytes of space on stack
 */
#define ITOA_BUFFER -16

#define ASCII_PERCENT_SIGN 37
#define ASCII_S 115
#define ASCII_D 100

.text
	.globl fprintf
	.type fprintf, @function
	fprintf:
		pushl %ebp
		movl %esp, %ebp

		subl $-ITOA_BUFFER, %esp

		/* offset to current char in the format string */
		xorl %edi, %edi
		/* offset to current argument */
		xorl %ecx, %ecx

		.Lloop:
			movl FORMAT(%ebp), %eax
			xorl %ebx, %ebx
			movb (%eax, %edi, 1), %bl

			cmpb $0, %bl
			je .Lreturn

			cmpb $ASCII_PERCENT_SIGN, %bl
			jne .Lwritechar

			incl %edi

			movl FORMAT(%ebp), %eax
			xorl %ebx, %ebx
			movb (%eax, %edi, 1), %bl

			cmpb $ASCII_S, %bl
			je .Lprint_string

			cmpb $ASCII_D, %bl
			je .Lprint_int

			.Lend_of_loop:
			incl %edi

			jmp .Lloop
		.Lprint_int:
			incl %ecx

			leal ITOA_BUFFER(%ebp), %eax

			pushl $-ITOA_BUFFER
			pushl %eax
			pushl FORMAT(%ebp, %ecx, 4)
			call itoa
			addl $12, %esp

			cmpl $0, %eax
			je .Lend_of_loop

			pushl %eax
			pushl FD(%ebp)
			call fprint
			addl $8, %esp

			jmp .Lend_of_loop
		.Lprint_string:
			incl %ecx

			pushl FORMAT(%ebp, %ecx, 4)
			pushl FD(%ebp)
			call fprint
			addl $8, %esp

			jmp .Lend_of_loop
		.Lwritechar:
			leal (%eax, %edi, 1), %eax

			pushl $1
			pushl %eax
			pushl FD(%ebp)
			call syscall_write
			addl $12, %esp

			cmpl $1, %eax
			jne .Lerror

			jmp .Lend_of_loop
		.Lerror:
			movl $EXIT_FAILURE, %eax
			jmp .Lquit

			movl %ebp, %esp
			popl %ebp
			ret
		.Lreturn:
			movl $EXIT_SUCCESS, %eax
		.Lquit:
			movl %ebp, %esp
			popl %ebp
			ret
