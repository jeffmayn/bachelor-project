#!/bin/bash
make clean -C ../ -s
make -C ../
for file in *.kit
do
  printf "\n\n\n /********* $file **********\\ \n"
  ../exp < "$file"
done
make clean -C ../ -s
