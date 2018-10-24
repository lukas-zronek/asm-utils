CC := clang
INC := ../inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h

start.o : start.S
	$(CC) $(CFLAGS) -I $(INC) -c $<

clean:
	rm -f *.o

.PHONY: clean
