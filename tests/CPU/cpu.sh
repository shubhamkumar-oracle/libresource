# Enable #define TESTING and the recompile library - make
export LD_LIBRARY_PATH=`git rev-parse --show-toplevel`
cd $LD_LIBRARY_PATH
cd tests/CPU
rm -f cpu_info.txt
rm -f cpu_info.orig
cc -I $LD_LIBRARY_PATH -std=gnu99 -o cpu_test cpu_test.c -L $LD_LIBRARY_PATH -lresource
cat /proc/cpuinfo > ./cpu_info.orig
./cpu_test
diff ./cpu_info.orig ./cpu_info.txt
