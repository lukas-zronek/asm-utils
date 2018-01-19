#ifndef _SYSCALL_H_
#define _SYSCALL_H_

#define SYSCALL_VECTOR	0x80
#define SYS_EXIT	1
#define SYS_READ	3
#define SYS_WRITE	4
#define SYS_OPEN	5
#define SYS_CLOSE	6
#define SYS_SELECT	93
#define SYS_RENAME	128
#define SYS_MKDIR	136
#define SYS_GETDIRENTRIES 196
#define SYS_NANOSLEEP	240

#endif
