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
	@echo "CC	$@"
	@$(CC) $(CFLAGS) -c -o $@ $<

%.s.o: %.s
	@echo "AS	$@"
	@$(AS) $(AFLAGS) -c -o $@ $<

all: $(OBJS) static shared

static: $(OBJS)
	@echo "AR	$(TARGET).a"
	@$(AR) rc $(TARGET).a $(OBJS)
	@echo "RANLIB	$(TARGET).a"
	@$(RANLIB) $(TARGET).a

shared: $(OBJS)
	@echo "SHARED	$(TARGET).so"
	@$(CC) $(CFLAGS) -shared -o $(TARGET).so $(OBJS)
clean:
	@echo "RM	OBJS"
	@echo "RM	$(TARGET).*"
	@$(RM) $(OBJS) $(TARGET).*

distclean: clean

.PHONY: all clean distclean shared static

