#ifndef _PLATFORM_H_
#define _PLATFORM_H_

#ifdef __APPLE__
/* .type directive is not available on macOS, it is overwritten with an empty macro */
.macro .type
.endm

.macro .rodata
.section __TEXT,__const
.endm
#else
.macro .rodata
.section .rodata
.endm
#endif
#if defined(__OpenBSD__)
/*
 * From https://cvsweb.openbsd.org/cgi-bin/cvsweb/~checkout~/src/lib/csu/os-note-elf.h?rev=1.5&content-type=text/plain
 */
.section ".note.openbsd.ident", "a"
	.p2align 2
	.long   8
	.long   4
	.long   1
	.asciz "OpenBSD"
	.long   0
	.previous
#endif

#endif /* _PLATFORM_H_ */
