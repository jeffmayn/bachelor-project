#!/bin/bash
for file in test/testPart3/p1.kit; do
  echo "########" $file
  ./build/compiler < $file > a.s &&
  gcc -no-pie a.s &&
  file=${file##*/} &&
  #./a.out > test/unitTests/tmp/expected/${file%.kit}.txt
  ./a.out
  echo ret $?
done
