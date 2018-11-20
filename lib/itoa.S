/*
 * char *itoa(int value, char *buffer, int buffer_size);
 *
 * This function converts an integer to ASCII,
 * copies it to the buffer and returns the pointer to the start of the string
 * or 0 on error.
 *
 */

#define VALUE 8
#define BUFFER 12
#define BUFFER_SIZE 16

#define ASCII_ZERO 48

.text
	.globl itoa
	.type itoa, @function
	itoa:
		pushl %ebp
		movl %esp, %ebp

		pushl %ebx
		pushl %edx
		pushl %edi

		movl BUFFER_SIZE(%ebp), %edi

		cmpl $2, %edi
		jl .Lerror

		decl %edi

		movl BUFFER(%ebp), %eax
		addl %edi, %eax
		movb $0, (%eax)

	.Lloop:
		/* %eax / 10 = %eax; %eax % 10 = %edx */
		xorl %edx, %edx
		movl VALUE(%ebp), %eax
		movl $10, %ebx
		divl %ebx
		movl %eax, VALUE(%ebp)

		addl $ASCII_ZERO, %edx

		decl %edi
		movl BUFFER(%ebp), %eax
		addl %edi, %eax
		movb %dl, (%eax)

		cmpl $0, VALUE(%ebp)
		je .Lreturn

		cmpl $0, %edi
		je .Lerror /* buffer to small */

		jmp .Lloop
	.Lreturn:
		movl BUFFER(%ebp), %eax
		addl %edi, %eax
	.Lquit:
		popl %edi
		popl %edx
		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
	.Lerror:
		xorl %eax, %eax
		jmp .Lquit
