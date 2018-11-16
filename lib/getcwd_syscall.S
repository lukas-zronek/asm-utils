/*
 * char * getcwd(char *buf, size_t size);
 *
 * This implementation uses the getcwd syscall of the FreeBSD:
 *
 *	int getcwd(char *buf, size_t buflen);
 *
 * FreeBSD returns a pointer to the buffer on success and NULL on error.
 *
 */

#define BUF 8
#define SIZE 12

.text
	.globl getcwd
	.type getcwd, @function
	getcwd:
		pushl %ebp
		movl %esp, %ebp

		pushl SIZE(%ebp)
		pushl BUF(%ebp)
		call syscall_getcwd
		addl $8, %esp

		cmpl $0, %eax
		jne .Lerror

		movl BUF(%ebp), %eax
	.Lquit:
		movl %ebp, %esp
		popl %ebp
		ret
	.Lerror:
		xorl %eax, %eax
		jmp .Lquit
