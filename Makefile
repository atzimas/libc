srcdir	= src

AR	= llvm-ar
AS	= clang
CC	= clang
RANLIB	= llvm-ranlib

AFLAGS	= -Os -pipe -Wall -Wextra -ffreestanding -nostdlib -I. -Iinclude
CFLAGS	= -Os -pipe -Wall -Wextra -ffreestanding -nostdlib -I. -Iinclude

SRCS_C	= $(wildcard $(srcdir)/**/*.c)
SRCS_S	= $(wildcard $(srcdir)/**/*.s)
OBJS	= $(SRCS_C:.c=.c.o) $(SRCS_S:.s=.s.o)
TARGET	= libc

%.c.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.s.o: %.s
	$(AS) $(AFLAGS) -c -o $@ $<

all: $(OBJS) static shared

static: $(OBJS)
	$(AR) rc $(TARGET).a $(OBJS)
	$(RANLIB) $(TARGET).a

shared: $(OBJS)
	$(CC) $(CFLAGS) -shared -o $(TARGET).so $(OBJS)
clean:
	$(RM) $(OBJS) $(TARGET).*

distclean: clean

.PHONY: all clean distclean shared static

