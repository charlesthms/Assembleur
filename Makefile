#
# Linux makefile
# Use with make 
#

.SUFFIXES:
.SUFFIXES: .o .asm
.PHONY: all

PROGS=5

#AS=nasm
AS=yasm
ASFLAGS=  -g dwarf2 -f elf64
CFLAGS= -m64 -g 
# pour les tableaux
#CFLAGS= -m64 -g  -no-pie 
CC=gcc  

.asm.o:
	$(AS) $(ASFLAGS) $*.asm

all:  $(PROGS)

%: %.o
	$(CC) $(CFLAGS) -o$* $*.o

clean :
	rm -f $(PROGS)

