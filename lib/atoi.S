/*
 * int atoi(const char *nptr);
 *
 * This function converts an ASCII character digit to the corresponding integer.
 * Numbers are always treated as decimal.
 * If characters are found that can not be interpreted,
 * the conversion is aborted and the previously
 * interpreted number is returned.
 *
 */

#define NPTR 8
#define RESULT -4

.text
	.globl atoi
	.type atoi, @function
	atoi:
		pushl %ebp
		movl %esp, %ebp

		subl $4, %esp

		pushl NPTR(%ebp)
		call strlen
		addl $4, %esp

		movl %eax, %edi

		movl $0, %ecx

		movl $0, RESULT(%ebp)

		loop:
			cmpl $0, %edi
			je quit

			decl %edi

			xorl %ebx, %ebx
			movl NPTR(%ebp), %eax
			movb (%eax, %edi, 1), %bl

			# '-' ... 45
			cmpb $45, %bl
			je negative

			# '0' ... 48
			cmpb $48, %bl
			jl quit

			# '9' ... 57
			cmpb $57, %bl
			jg quit

			subb $48, %bl

			pushl %ebx
			pushl %ecx
			pushl %edi

			pushl %ecx
			pushl $10
			call pow
			addl $8, %esp

			popl %edi
			popl %ecx
			popl %ebx

			# %eax = %ebx * %eax
			mull %ebx

			movl RESULT(%ebp), %ebx
			addl %ebx, %eax
			movl %eax, RESULT(%ebp)

			incl %ecx

			jmp loop
		quit:
			movl RESULT(%ebp), %eax

			movl %ebp, %esp
			popl %ebp
			ret
		negative:
			negl RESULT(%ebp)
			jmp quit
