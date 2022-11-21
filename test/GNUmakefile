LIB_DIR := $(realpath ../lib)
CFLAGS := -O0 -arch i386 -m32 -nostdinc -Wall -fno-builtin -fno-pie -fno-stack-protector
LDFLAGS := -arch i386 -m32 -nostdlib
EXEC := arg hello
LIB_NAME := sys
UNAME := $(shell uname -s)
CSU := $(LIB_DIR)/csu/start.o
CSU_DEBUG := $(LIB_DIR)/csu/start_debug.o

LDFLAGS_STATIC = -static -L$(LIB_DIR) -o $@ $< $(CSU) -l$(LIB_NAME)
LDFLAGS_DYNAMIC = -dynamic -Wl,-rpath,$(LIB_DIR) -L$(LIB_DIR) -o $@ $< $(CSU) -l$(LIB_NAME)

DEFAULT_TARGET := dynamic

include $(wildcard *.$(UNAME).in)

all: $(DEFAULT_TARGET)

debug: CSU := $(CSU_DEBUG)
debug: CFLAGS += -g
debug: all

static: LDFLAGS += $(LDFLAGS_STATIC)
static: $(EXEC)

dynamic: LDFLAGS += $(LDFLAGS_DYNAMIC)
dynamic: $(EXEC)

$(EXEC): %: %.o
	$(CC) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

strip:
	strip -x $(EXEC)

clean:
	rm -f *.o $(EXEC)

.PHONY: all clean static dynamic
