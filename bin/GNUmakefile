LIB_DIR := $(realpath ../lib)
INC := $(LIB_DIR)/inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS := -m32 -nostdlib -no-pie
EXEC := $(patsubst %.S,%,$(wildcard *.S))
LIB_NAME := sys
UNAME := $(shell uname -s)
CSU := $(LIB_DIR)/csu/start.o
CSU_DEBUG := $(LIB_DIR)/csu/start_debug.o
INC_PLATFORM := $(INC)/$(UNAME)

LDFLAGS_STATIC = -static -L$(LIB_DIR) -o $@ $< $(CSU) -l$(LIB_NAME)
LDFLAGS_DYNAMIC = -dynamic -Wl,-rpath,$(LIB_DIR) -L$(LIB_DIR) -o $@ $< $(CSU) -l$(LIB_NAME)

DEFAULT_TARGET := static

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

%.o: %.S
	$(CC) $(CFLAGS) -I $(INC_PLATFORM) -I $(INC) -c $<

strip:
	strip -x $(EXEC)

clean:
	rm -f *.o $(EXEC)

.PHONY: all debug clean static dynamic strip
