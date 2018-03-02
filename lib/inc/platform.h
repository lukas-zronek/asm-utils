#ifdef __APPLE__
/* .type directive is not available on macOS, it is overwritten with an empty macro */
.macro .type
.endm
#endif
