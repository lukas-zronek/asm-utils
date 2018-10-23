/*
 * int copyfile(int src_fd, int dst_fd);
 *
 * This function copies the data from src_fd to dst_fd.
 */

#define BUFFER_SIZE 1024

#define SRC_FD 8
#define DST_FD 12
#define BUFFER -BUFFER_SIZE

.text
	.globl copyfile
	.type copyfile, @function
	copyfile:
		pushl %ebp
		movl %esp, %ebp

		subl $BUFFER_SIZE, %esp

		pushl %ebx
		pushl %ecx
	.Lread_loop:
		leal BUFFER(%ebp), %eax
		pushl $BUFFER_SIZE
		pushl %eax
		pushl SRC_FD(%ebp)
		call syscall_read
		addl $12, %esp

		cmpl $0, %eax
		je .Lsuccess
		jl .Lerror

		xorl %ebx, %ebx /* Number of bytes already written */
		movl %eax, %ecx /* Number of bytes to be written */
	.Lwrite_loop:
		pushl %eax
		leal BUFFER(%ebp), %eax
		pushl %eax
		pushl DST_FD(%ebp)
		call syscall_write
		addl $12, %esp

		cmpl $-1, %eax
		je .Lerror

		addl %eax, %ebx

		cmpl %ebx, %ecx
		jl .Lwrite_loop

		jmp .Lread_loop
	.Lerror:
		movl $1, %eax
		jmp .Lreturn
	.Lsuccess:
		xorl %eax, %eax
	.Lreturn:
		popl %ecx
		popl %ebx

		movl %ebp, %esp
		popl %ebp
		ret
