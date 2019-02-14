/*
 * DIR *opendir(const char *filename);
 *
 * This function opens the directory named by filename and returns a DIR
 * structure on success or 0 on error.
 *
 * struct DIR {
 * 	int fd;
 * 	char *buffer;
 * 	int offset;
 * }
 *
 * This implementation uses the getdirentries syscall of FreeBSD and macOS:
 *
 * 	int getdirentries(int fd, char *buf, u_int count, long *basep);
 *
 *	struct dirent {
 *		__uint32_t d_fileno;
 *		__uint16_t d_reclen;
 *		__uint8_t  d_type;
 *		__uint8_t  d_namlen;
 *		char       d_name[255 + 1];
 *	};
 *
 *	typedef unsigned int __uint32_t;
 *	typedef	unsigned short __uint16_t;
 *	typedef	unsigned char __uint8_t;
 *
 */

#include <io.h>
#include <dir.h>

#define FILENAME 8
#define BASEP -4

.bss
	.comm buffer_data, DIR_BUFFER_SIZE
	.comm dir, 12
.text
	.globl opendir
	.type opendir, @function
	opendir:
		pushl %ebp
		movl %esp, %ebp

		subl $-BASEP, %esp

		movl $O_RDONLY, %eax
		orl $O_DIRECTORY, %eax

		pushl %eax
		pushl FILENAME(%ebp)
		call syscall_open
		addl $8, %esp

		cmpl $-1, %eax
		je .Lerror

		movl %eax, dir+DIR_FD

		/* a = &basep */
		leal BASEP(%ebp), %eax

		pushl %eax
		pushl $DIR_BUFFER_SIZE
		pushl $buffer_data
		pushl dir+DIR_FD
		call syscall_getdirentries
		addl $16, %esp

		cmpl $-1, %eax
		je .Lerror

		movl $buffer_data, dir+DIR_BUFFER
		movl $0, dir+DIR_OFFSET

		movl $dir, %eax
	.Lquit:
		movl %ebp, %esp
		popl %ebp
		ret
	.Lerror:
		xorl %eax, %eax
		jmp .Lquit
