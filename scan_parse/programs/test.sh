#!/bin/bash
make clean -C ../
make -C ../
for file in *.kit
do
  printf "\n\n\n /********* $file **********\\ \n"
  ../exp < "$file"
done
