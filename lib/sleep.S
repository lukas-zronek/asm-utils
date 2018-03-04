#ifdef __APPLE__
#include "sleep_select.S"
#else
#include "sleep_nanosleep.S"
#endif
