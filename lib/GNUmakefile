AR := ar
INC := inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS_EXTRA := -Wl,-shared -Wl,--no-undefined
LDFLAGS = -m32 -nostdlib $(LDFLAGS_EXTRA)
LIB_NAME := sys
LIB_AR := lib$(LIB_NAME).a
LIB_SO := lib$(LIB_NAME).so
UNAME := $(shell uname -s)
SYSCALLS := gen/syscalls.S
SYSCALLS_LIST := syscalls.$(UNAME).list
SYSCALLS_TEMPLATE := syscalls.S.template

include $(wildcard *.$(UNAME).in)

all: $(SYSCALLS) $(LIB_AR) $(LIB_SO)

$(SYSCALLS): $(SYSCALLS_TEMPLATE) $(SYSCALLS_LIST)
	./makesyscalls.sh $(SYSCALLS_TEMPLATE) $(SYSCALLS_LIST) $(SYSCALLS)

$(LIB_AR): $(OBJS)
	$(AR) rs $@ $(OBJS)

$(LIB_SO): $(OBJS)
	$(CC) $(LDFLAGS) -o $(LIB_SO) $(OBJS)

%.o : %.S
	$(CC) $(CFLAGS) -I $(INC) -c $<

clean:
	rm -f *.o $(LIB_AR) $(LIB_SO) $(SYSCALLS)

.PHONY: all clean
