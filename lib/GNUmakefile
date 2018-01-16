CC := clang
AR := ar
CFLAGS := -m32 -nostdinc -Wall
LDFLAGS := -m32 -nostdlib -Wl,-shared
OBJS := $(patsubst %.S,%.o,$(wildcard *.S))
LIB_NAME := sys
LIB_AR := lib$(LIB_NAME).a
LIB_SO := lib$(LIB_NAME).so
INC := inc

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
