#ifndef _ASM_H_
#define _ASM_H_

/*
 * .type directive is not available on macOS, it is overwritten with
 * an empty macro.
 */
.macro .type
.endmacro

.macro .bss
.section __DATA,__bss
.endmacro

.macro .rodata
.section __TEXT,__const
.endmacro

#endif /* _ASM_H_ */
