#!/bin/bash
for file in kimTest/O_Knapsack.src; do
#for file in test/testPart4/peepholeTest2.kit; do
  echo "########" $file
  ./build/compiler -DR < $file > a.s &&
  gcc -no-pie a.s &&
  file=${file##*/} &&
  #./a.out > test/unitTests/tmp/expected/${file%.kit}.txt
  ./a.out
  echo ret $?
done
