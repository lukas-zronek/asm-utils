#include <io.h>

#define BUFFER_SIZE 1024
#define ARGC 0
#define ARGV 8
#define FD -4
#define BASEP -8
#define NREAD -12
#define DIRENT -16
#define DIRENT_RECLEN_OFFSET 4
#define DIRENT_TYPE_OFFSET 6
#define DIRENT_NAME_OFFSET 8
#define DIRENT_TYPE_REG 8

.bss
	.lcomm buffer_data, BUFFER_SIZE
.data
	cwd:
        	.asciz "."
.text
	.globl _start
	_start:
		movl %esp, %ebp

		subl $20, %esp

		movl $O_RDONLY, %eax
		orl $O_DIRECTORY, %eax
		pushl %eax

		cmpl $2, ARGC(%ebp)
		jl noarg

		pushl ARGV(%ebp)
		jmp open_dir

		noarg:
		pushl $cwd

		open_dir:

		call open
		addl $8, %esp

		movl %eax, FD(%ebp)

		cmpl $-1, %eax
		je error

		# a = &basep
		leal BASEP(%ebp), %eax

		pushl %eax
		pushl $BUFFER_SIZE
		pushl $buffer_data
		pushl FD(%ebp)
		call getdirentries
		addl $12, %esp

		movl %eax, NREAD(%ebp)

		cmpl $-1, %eax
		je error

		cmpl $0, %eax
		je quit

		movl $0, %edi

		loop:
			cmpl NREAD(%ebp), %edi
			jge quit

			/*
			/usr/include/sys/dirent.h:
			struct dirent {
				__uint32_t d_fileno;
				__uint16_t d_reclen;
				__uint8_t  d_type;
				__uint8_t  d_namlen;
				char       d_name[255 + 1];
			};

			/usr/include/x86/_types.h:
			typedef unsigned int __uint32_t;
			typedef	unsigned short __uint16_t;
			typedef	unsigned char __uint8_t;
			*/

			movl $buffer_data, %eax
			addl %edi, %eax
			movl %eax, %ebx

			addl $DIRENT_NAME_OFFSET, %eax

			pushl %edi

			pushl %eax
			call puts
			addl $4, %esp

			pop %edi

			next:
		
			# d_reclen
			movl $buffer_data, %eax
			addl %edi, %eax
			addl $DIRENT_RECLEN_OFFSET, %eax
			xorl %ebx, %ebx # set register to zero
			movw (%eax), %bx # unsigned short/__uint16_t (2 Bytes)
			addl %ebx, %edi

			jmp loop
		quit:
			pushl FD(%ebp)
			call close
			addl $4, %esp

			cmpl $-1, %eax
			je error

			pushl $0
			call exit
		error:
			pushl ARGV(%ebp)
			call perror
			addl $4, %esp

			pushl $1
			call exit
