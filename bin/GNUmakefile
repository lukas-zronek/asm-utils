CC := clang
CFLAGS := -m32 -nostdinc -Wall
LDFLAGS := -m32 -nostdlib
EXEC := $(patsubst %.S,%,$(wildcard *.S))
LIB_NAME := sys
LIB_DIR := ../lib
INC := $(LIB_DIR)/inc

LDFLAGS_STATIC = -static -L$(LIB_DIR) -o $@ $< -l$(LIB_NAME)
LDFLAGS_DYNAMIC = -dynamic -rpath $(LIB_DIR) -L$(LIB_DIR) -Wl,-as-needed -o $@ $< -l$(LIB_NAME)

UNAME := $(shell uname -s)

ifeq ($(UNAME),Darwin)
ifeq ($(MAKECMDGOALS),dynamic)
$(error dynamic target is not supported on macOS)
endif
DEFAULT_TARGET := static
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

clean:
	rm -f *.o $(EXEC)

.PHONY: all clean static dynamic
