CC := clang
AR := ar
CFLAGS := -m32 -nostdinc -Wall
LDFLAGS := -m32 -nostdlib -Wl,-shared
OBJS := syscalls.o atoi.o errno.o fprint.o perror.o puts.o strerror.o errlst.o fgets.o fputs.o pow.o sleep.o strlen.o
LIB_NAME := sys
LIB_AR := lib$(LIB_NAME).a
LIB_SO := lib$(LIB_NAME).so
INC := inc
SYSCALLS_LIST=syscalls.list

all: $(LIB_AR) $(LIB_SO)

syscalls.S: syscalls.S.head syscalls.S.stub $(SYSCALLS_LIST)
	./makesyscalls.sh $(SYSCALLS_LIST)

$(LIB_AR): $(OBJS)
	$(AR) rs $@ $(OBJS)

$(LIB_SO): $(OBJS)
	$(CC) $(LDFLAGS) -o $(LIB_SO) $(OBJS)

%.o : %.S
	$(CC) $(CFLAGS) -I $(INC) -c $<

clean:
	rm -f *.o syscalls.S $(LIB_AR) $(LIB_SO)

.PHONY: all clean
