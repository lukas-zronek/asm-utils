#ifndef _IO_H_
#define _IO_H_

#define STDIN_FILENO	0
#define STDOUT_FILENO	1
#define STDERR_FILENO	2
#define O_RDONLY	0x0000
#define O_WRONLY	0x0001

#ifdef __linux__
#define O_CREAT		0x0080
#define O_EXCL		0x0040
#define O_DIRECTORY	0x10000
#else
#define O_CREAT		0x0200
#define O_EXCL		0x0800
#define O_DIRECTORY	0x100000
#endif /* __linux__*/

#endif /* _IO_H_ */
