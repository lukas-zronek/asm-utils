CFLAGS := -arch i386 -m32 -nostdinc -Wall
UNAME := $(shell uname -s)

include $(wildcard GNUmakefile.$(UNAME).in)

dynamic: all
all: start.o
debug: start_debug.o

start.o: start.S
	$(CC) $(CFLAGS) -c $<

start_debug.o: start.S
	$(CC) $(CFLAGS) -g -c $< -o $@

clean:
	rm -f *.o

.PHONY: all debug dynamic clean
