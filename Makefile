-include Makefile.cfg

OBJDIR=obj
SRCDIR=src

_CC=gcc
LD=ld
CFLAGS = -std=c11 -Wall
DEFS += -D_XOPEN_SOURCE=500

_OBJS = main.o

ifdef PROFILE
CFLAGS += -pg
LDFLAGS += -pg
endif

ifdef RELEASE
DEFS += -xSSE3 -O3 -DNDEBUG
else
DEFS += -g -O2
endif

CC = $(PREFIX)$(_CC)
OBJS = $(patsubst %,$(OBJDIR)/%,$(_OBJS))

install: argvspoof

argvspoof: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(OBJDIR)
	$(CC) -c -o $@ $< $(CFLAGS) $(DEFS)

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	rm -rf $(OBJDIR)/*.o argvspoof

.PHONY: clean install
