#!/bin/sh

# Enable -DTESTING in Makefile and the recompile library - make
export LD_LIBRARY_PATH=`git rev-parse --show-toplevel`
cd $LD_LIBRARY_PATH
cd tests/VM
rm -f vm_info.txt
rm -f vm_info.orig
cc -I $LD_LIBRARY_PATH -std=gnu99 -o vm_test vm_test.c -L $LD_LIBRARY_PATH -lresource
cat /proc/vmstat > ./vm_info.orig
./vm_test
diff ./vm_info.orig ./vm_info.txt
