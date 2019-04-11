#!/bin/bash
./build/compiler < test/testPart4/p41.kit > a.s
gcc -no-pie a.s
./a.out
