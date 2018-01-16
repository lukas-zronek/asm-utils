# size_t strlen(const char *s);

#define STRING 8

.text
	.globl strlen
	.type strlen, @function
	strlen:
		pushl %ebp
		movl %esp, %ebp

		movl $0, %edi
		movl STRING(%ebp), %edx

		loop:
			movb (%edx, %edi, 1), %al
			cmpb $0, %al
			je return
			incl %edi
			jmp loop

		return:
			movl %edi, %eax

			movl %ebp, %esp
			popl %ebp
			ret
