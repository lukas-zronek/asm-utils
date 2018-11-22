CFLAGS := -m32 -nostdinc -Wall
UNAME := $(shell uname -s)

include $(wildcard GNUmakefile.$(UNAME).in)

start.o : start.S
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o

.PHONY: clean
