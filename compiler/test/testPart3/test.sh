#!/bin/bash
make clean -C ../../ -s
make -C ../../
for file in *.kit
do
  printf "\n\n\n /********* $file **********\\ \n"
  ../../build/compiler < "$file"
done
#make clean -C ../../ -s
