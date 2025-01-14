CC = gcc
CFLAGS = -g -Wall -Werror -fPIC -std=gnu99
DEPS = resource.h resource_impl.h resmem.h resnet.h resproc.h resvm.h rescpu.h resfs.h
OBJ = resource.o resmem.o resnet.o resproc.o reskern.o resvm.o rescpu.o resfs.o net_if.o net_route.o net_arp.o
TEST = test
RM = rm -rf
CP = cp
ABI_MAJOR=0
ABI_MINOR=1
ABI_MICRO=1
ABI=$(ABI_MAJOR).$(ABI_MINOR).$(ABI_MICRO)
LIB = libresource.so.$(ABI)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(OBJ)
	$(CC) -shared -Wl,-soname,libresource.so.$(ABI_MAJOR) -o $(LIB) $^ $(CFLAGS)
	ln -s ./libresource.so.$(ABI) ./libresource.so 
	ln -s ./libresource.so.$(ABI) ./libresource.so.${ABI_MAJOR}

.PHONY : clean
clean:
	$(RM) $(LIB) $(OBJ) $(TEST) *.so*
