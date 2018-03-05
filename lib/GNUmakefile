CC := clang
AR := ar
INC := inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS := -m32 -nostdlib -Wl,-shared -Wl,--no-undefined
OBJS := fprintf.o itoa.o atoi.o errno.o fprint.o perror.o puts.o strerror.o errlst.o fgets.o fputs.o pow.o sleep.o strlen.o
LIB_NAME := sys
LIB_AR := lib$(LIB_NAME).a
LIB_SO := lib$(LIB_NAME).so
SYSCALLS_LIST := syscalls.list
UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
SYSCALLS_LIST := syscalls.darwin.list
all: $(LIB_AR)
else
all: $(LIB_AR) $(LIB_SO)
endif

syscalls.d: syscalls.S.stub $(SYSCALLS_LIST)
	./makesyscalls.sh $(SYSCALLS_LIST)

include syscalls.d
OBJS += $(patsubst %.S,%.o,$(SYSCALLS_SRC))

$(LIB_AR): syscalls.d $(OBJS)
	$(AR) rs $@ $(OBJS)

$(LIB_SO): syscalls.d $(OBJS)
	$(CC) $(LDFLAGS) -o $(LIB_SO) $(OBJS)

%.o : %.S
	$(CC) $(CFLAGS) -I $(INC) -c $<

clean:
	rm -f *.o syscalls.d $(LIB_AR) $(LIB_SO) syscall_*.S

.PHONY: all clean
