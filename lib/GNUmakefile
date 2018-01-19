CC := clang
AR := ar
INC := inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS := -m32 -nostdlib
OBJS := $(patsubst %.S,%.o,$(wildcard *.S))
LIB_NAME := sys
LIB_AR := lib$(LIB_NAME).a

UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
LDFLAGS += -Wl,-dylib,-read_only_relocs,suppress
LIB_SO := lib$(LIB_NAME).dylib
else
LDFLAGS += -Wl,-shared
LIB_SO := lib$(LIB_NAME).so
endif

all: $(LIB_AR) $(LIB_SO)

$(LIB_AR): $(OBJS)
	$(AR) rs $@ $(OBJS)

$(LIB_SO): $(OBJS)
	$(CC) $(LDFLAGS) -o $(LIB_SO) $(OBJS)

%.o : %.S
	$(CC) $(CFLAGS) -I $(INC) -c $<

clean:
	rm -f *.o $(LIB_AR) $(LIB_SO)

.PHONY: all clean
