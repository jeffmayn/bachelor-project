#!/bin/bash
#make clean -C ../ -s
make -C ../
reset
printf "<<<<<< STARTING TEST SUITE >>>>>>\n"
echo "Test 1 is checking for correct return value of program."
echo "Test 2 compare output of program with expected output."
printf "\n\n"


# compile files to assembly and produce executables
invoke_asm() {
  ../../build/compiler < $1.kit > tmp/$1.s 2>/dev/null
  gcc -no-pie -m64 tmp/$1.s -o tmp/$1.dat
  ./tmp/$1.dat > tmp/output/$1.txt
  rm tmp/*.dat
  rm tmp/*.s
  invoke_cmp $1
}

invoke_log(){
  #sed -i '1s;^;############################\n\n;' log/$1.log
  ../../build/compiler < "$1.kit" > log/$1.log 2>&1
  sed -i '1s;^;\n############################\nOther stuff:\n------------\n;' log/$1.log
  cat tmp/expected/$1.txt log/$1.log >out && mv out log/$1.log
  sed -i '1s;^;\n############################\nExpected output:\n----------------\n;' log/$1.log
  cat tmp/output/$1.txt log/$1.log >out && mv out log/$1.log
  sed -i '1s;^;############################\nActual output:\n--------------\n;' log/$1.log
}

# compare on two files
invoke_cmp() {
  if cmp -s "tmp/output/$1.txt" "tmp/expected/$1.txt" ; then
    echo "  |--> Test 2: SUCCESS!"
  else
    echo "  |--> Test 2: FAILED!"
    echo "  |--> SEE LOGFILE: ${PWD##}/log/$1.log"
    invoke_log $1
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
        printf " |--> File: $file \n"
        ../../build/compiler < "$file" >/dev/null 2>&1
        v=$?
        #echo $v
        if [ $v -eq $ret ]
        then
          echo "  |--> Test 1: SUCCESS!"
          invoke_asm "$filename$count"
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
