CFLAGS := -m32 -nostdinc -Wall

start.o : start.S
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o

.PHONY: clean
