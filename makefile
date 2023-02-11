LIBTARGET=libtokenizer.so
CC=g++
# compiler
CC=g++
# debug
DEBUG=-g
# optimisation
OPT=-O0
# warnings
WARN=-Wall -Wextra -Werror
#src directory
SRCDIR=src
#object directoy
CPPVERSION=-std=c++17
LIBFLAGS=-fPIC
OBJDIR=obj

LIBCCFLAGS=$(DEBUG) ${LIBFLAGS} ${CPPVERSION} $(OPT) $(WARN)
# linker
LD=g++
LDFLAGS=-lstdc++
LIBLDFLAGS=-lstdc++ -shared -W1,-soname,${LIBTARGET}

LIBOBJS=$(OBJDIR)/LCharType.o \
$(OBJDIR)/LSymbol.o \
$(OBJDIR)/LWhiteSpace.o \
$(OBJDIR)/LTokenizerUtilities.o \
$(OBJDIR)/LTokenizer.o \

all: $(LIBOBJS)
	$(LD) $(LIBLDFLAGS) -o $(LIBTARGET) $(LIBOBJS) -lc

lib: $(LIBOBJS)
	$(LD) $(LIBLDFLAGS) -o $(LIBTARGET) $(LIBOBJS) -lc

$(OBJDIR)/LCharType.o:
	$(CC) -c $(LIBCCFLAGS) $(SRCDIR)/Types/CharType.cpp -o $(OBJDIR)/LCharType.o

$(OBJDIR)/LSymbol.o:
	$(CC) -c $(LIBCCFLAGS) $(SRCDIR)/Types/Symbol.cpp -o $(OBJDIR)/LSymbol.o

$(OBJDIR)/LWhiteSpace.o:
	$(CC) -c $(LIBCCFLAGS) $(SRCDIR)/Types/WhiteSpace.cpp -o $(OBJDIR)/LWhiteSpace.o

$(OBJDIR)/LTokenizerUtilities.o:
	$(CC) -c $(LIBCCFLAGS) $(SRCDIR)/Utils/TokenizerUtilities.cpp -o $(OBJDIR)/LTokenizerUtilities.o

$(OBJDIR)/LTokenizer.o:
	$(CC) -c $(LIBCCFLAGS) $(SRCDIR)/Tokenizer.cpp -o $(OBJDIR)/LTokenizer.o
