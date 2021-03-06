/*
 * size_t strlen(const char *s);
 */

#define STRING 8

.text
	.globl strlen
	.type strlen, @function
	strlen:
		pushl %ebp
		movl %esp, %ebp

		pushl %edi
		pushl %edx

		movl $0, %edi
		movl STRING(%ebp), %edx
	.Lloop:
		movb (%edx, %edi, 1), %al
		cmpb $0, %al
		je .Lreturn
		incl %edi
		jmp .Lloop
	.Lreturn:
		movl %edi, %eax

		popl %edx
		popl %edi

		movl %ebp, %esp
		popl %ebp
		ret
