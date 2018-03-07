#ifndef _PLATFORM_H_
#define _PLATFORM_H_

#ifdef __APPLE__
/* .type directive is not available on macOS, it is overwritten with an empty macro */
.macro .type
.endm

.macro .rodata
.section __TEXT,__const
.endm
#endif

#endif /* _PLATFORM_H_ */
