#ifndef _PLATFORM_H_
#define _PLATFORM_H_

/*
 * .type directive is not available on macOS, it is overwritten with
 * an empty macro.
 */
#ifdef __APPLE__
.macro .type
.endm
#endif

#ifdef __APPLE__
.macro .rodata
.section __TEXT,__const
.endm
#else
.macro .rodata
.section .rodata
.endm
#endif

#endif /* _PLATFORM_H_ */
