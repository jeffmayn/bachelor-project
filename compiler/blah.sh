#!/bin/bash
#for file in kimTest/O_Knapsack.src; do
for file in test/testPart4/fibbo.kit; do
  #echo "########" $file
  ./build/compiler < $file > a.s 2>/dev/null  &&
  gcc -no-pie -g a.s &&
  file=${file##*/} &&
  #./a.out > test/unitTests/tmp/expected/${file%.kit}.txt
  for i in {0..9}; do
    /usr/bin/time '-f' "%e" ./a.out > /dev/null
  #echo ret $?
  done
done
