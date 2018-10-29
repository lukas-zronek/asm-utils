CC := clang
AR := ar
INC := inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS := -m32 -nostdlib -Wl,-shared -Wl,--no-undefined
LIB_NAME := sys
LIB_AR := lib$(LIB_NAME).a
LIB_SO := lib$(LIB_NAME).so
UNAME := $(shell uname -s)
SYSCALLS_LIST := syscalls.$(UNAME).list

include $(wildcard *.$(UNAME).in)

ifeq ($(UNAME),Darwin)
CFLAGS += -mmacosx-version-min=10.5
LDFLAGS := -mmacosx-version-min=10.5 -m32 -nostdlib -dynamiclib -Wl,-read_only_relocs,suppress -install_name @rpath/$(LIB_SO)
endif

syscalls.d: $(SYSCALLS_STUB) $(SYSCALLS_LIST)
	./makesyscalls.sh $(SYSCALLS_STUB) $(SYSCALLS_LIST)

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
