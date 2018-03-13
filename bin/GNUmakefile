CC := clang
LIB_DIR := $(realpath ../lib)
INC := $(LIB_DIR)/inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS := -m32 -nostdlib
EXEC := $(patsubst %.S,%,$(wildcard *.S))
LIB_NAME := sys
UNAME := $(shell uname -s)

LDFLAGS_STATIC = -static -L$(LIB_DIR) -o $@ $< -l$(LIB_NAME)
LDFLAGS_DYNAMIC = -dynamic -Wl,-rpath $(LIB_DIR) -L$(LIB_DIR) -Wl,-as-needed -o $@ $< -l$(LIB_NAME)

ifeq ($(UNAME),Darwin)
ifeq ($(MAKECMDGOALS),dynamic)
$(error dynamic target is not supported on macOS)
endif
DEFAULT_TARGET := static strip
LDFLAGS += -Wl,-e,_start
else
DEFAULT_TARGET := dynamic
endif

all: $(DEFAULT_TARGET)

static: LDFLAGS += $(LDFLAGS_STATIC)
static: $(EXEC)

dynamic: LDFLAGS += $(LDFLAGS_DYNAMIC)
dynamic: $(EXEC)

$(EXEC): %: %.o
	$(CC) $(LDFLAGS)

%.o: %.S
	$(CC) $(CFLAGS) -I $(INC) -c $<

strip:
	strip -x $(EXEC)

clean:
	rm -f *.o $(EXEC)

.PHONY: all clean static dynamic strip
