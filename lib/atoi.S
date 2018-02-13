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

		pushl %edi
		pushl %ebx
		pushl %ecx

		pushl NPTR(%ebp)
		call strlen
		addl $4, %esp

		movl %eax, %edi

		movl $0, %ecx

		movl $0, RESULT(%ebp)

		.Lloop:
			cmpl $0, %edi
			je .Lquit

			decl %edi

			xorl %ebx, %ebx
			movl NPTR(%ebp), %eax
			movb (%eax, %edi, 1), %bl

			# '-' ... 45
			cmpb $45, %bl
			je .Lnegative

			# '0' ... 48
			cmpb $48, %bl
			jl .Lquit

			# '9' ... 57
			cmpb $57, %bl
			jg .Lquit

			subb $48, %bl

			pushl %ecx
			pushl $10
			call pow
			addl $8, %esp

			# %eax = %ebx * %eax
			mull %ebx

			movl RESULT(%ebp), %ebx
			addl %ebx, %eax
			movl %eax, RESULT(%ebp)

			incl %ecx

			jmp .Lloop
		.Lquit:
			movl RESULT(%ebp), %eax

			popl %ecx
			popl %ebx
			popl %edi

			movl %ebp, %esp
			popl %ebp
			ret
		.Lnegative:
			negl RESULT(%ebp)
			jmp .Lquit
