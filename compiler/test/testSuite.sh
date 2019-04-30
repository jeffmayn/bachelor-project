#!/bin/bash
#make clean -C ../ -s
make -C ../
reset
printf "<<<<<< STARTING TEST SUITE >>>>>>\n"
echo "Test 1 is checking for correct return value of program."
echo "Test 2 compare binarys of program and expected program."
printf "\n\n"

dir="/testFolder/*"
# compare binarys on two files
invoke_cmp() {
  if cmp -s "$dir/file1.kit" "$dir/file2.kit" ; then
    echo " |--> Test 2: SUCCESS!"
  else
    echo " |--> Test 2: FAILED!"
  fi
}

# invoke_tests
invoke_tests () {
  echo "######## RUNNING TEST-FOLDER: ${PWD##*/} ########"
  while read line
  do
    for ret in $line
    do
      if ! [[ "$ret" =~ ^[0-9]+$ ]]
      then
        count=0
        #echo Found file-name \"$ret\"
        filename=$ret
      else
        ((count=count+1))
        file=$filename$count".kit" #its crazy but it works
        #echo $file
        printf " |--> File  : $file \n"
        ../../build/compiler < "$file" >/dev/null 2>&1
        v=$?
        #echo $v
        if [ $v -eq $ret ]
        then
          echo " |--> Test 1: SUCCESS!"
          invoke_cmp
          echo ""
        else
          ../../build/compiler < "$file" #>/dev/null 2>&1
          echo FAIL
          echo returned $v but expected $ret
        fi
      fi
    done
  done < returns.txt
  echo ""
}

#run tests in all subfolders
function beginTest() {
  for dir in ./*/; do (cd "$dir" && invoke_tests); done
}

beginTest
