#!/bin/bash
make clean -C ../ -s
make -C ../
for file in *.kit
do
  printf "\n\n\n /********* $file **********\\ \n"
  ../compiler < "$file"
done
make clean -C ../ -s