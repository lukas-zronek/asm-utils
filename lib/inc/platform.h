/* .type directive is not needed on macOS, it is overwritten with an empty macro */
#ifdef __APPLE__
.macro .type
.endm
#endif
