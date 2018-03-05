#ifdef __APPLE__
#include "getcwd_fcntl_getpath.S"
#else
#include "getcwd_syscall.S"
#endif
