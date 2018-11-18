LIB_DIR := $(realpath ../lib)
INC := $(LIB_DIR)/inc
CFLAGS := -m32 -nostdinc -Wall -include $(INC)/platform.h
LDFLAGS := -m32 -nostdlib
EXEC := $(patsubst %.S,%,$(wildcard *.S))
LIB_NAME := sys
UNAME := $(shell uname -s)
CSU := $(LIB_DIR)/csu/start.o

LDFLAGS_STATIC = -static -L$(LIB_DIR) -o $@ $< $(CSU) -l$(LIB_NAME)
LDFLAGS_DYNAMIC = -dynamic -Wl,-rpath,$(LIB_DIR) -L$(LIB_DIR) -o $@ $< $(CSU) -l$(LIB_NAME)

DEFAULT_TARGET := dynamic

include $(wildcard *.$(UNAME).in)

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
