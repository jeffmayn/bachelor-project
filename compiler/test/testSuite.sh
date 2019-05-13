#!/bin/bash
#make clean -C ../ -s
# ls *.kit > yoyo.dat && awk '{gsub(".kit", " 0");print}' yoyo.dat > returns.txt && rm yoyo.dat


make -C ../
yo=$?
#echo $v
if ! [ $yo -eq 0 ]
then
  RED='\033[0;31m'
  NC='\033[0m' # No Color
  printf "\n\n !! ${RED}TEST-SUITE NOT INITIALISED${NC} !!\n\n"
else
  reset
  invoke_cleanup(){
    rm log/*.log &>/dev/null
    rm tmp/output/*.txt &>/dev/null
  }

  if [ $1 == "clean" ]
  then
    printf "The cleansing has begun!\n"

    for dir in ./*/; do (cd "$dir" && invoke_cleanup); done
    printf "All log- and output-files is deleted!\n"
    else
      RED='\033[0;31m'
      YELLOW='\033[1;33m'
      GREEN='\033[0;32m'
      NC='\033[0m' # No Color
      printf "<<<<<< STARTING TEST SUITE >>>>>>\n"
      echo "Test 1 is checking for correct return value of program."
      echo "Test 2 compare output of program with expected output."
      printf "\n\n"


      # compile files to assembly and produce output files
      invoke_asm() {
        ../../build/compiler < $1.kit > tmp/$1.s 2>/dev/null
        gcc -no-pie -m64 tmp/$1.s -o tmp/$1.dat
        ./tmp/$1.dat > tmp/output/$1.txt
        rm tmp/*.dat
        rm tmp/*.s
        invoke_cmp $1
      }

      # if an test fails, a log is generated
      invoke_log(){
        if [ $2 -eq $3 ]; then
          ../../build/compiler < "$1.kit" > log/$1.log 2>&1
          sed -i '1s;^;\n############################\nOther stuff:\n------------\n;' log/$1.log
          cat tmp/expected/$1.txt log/$1.log >out && mv out log/$1.log
          sed -i '1s;^;\n############################\nExpected output:\n----------------\n;' log/$1.log
          cat tmp/output/$1.txt log/$1.log >out && mv out log/$1.log
          sed -i '1s;^;############################\nActual output:\n--------------\n;' log/$1.log
        else
          ../../build/compiler < "$1.kit" > log/$1.log 2>&1
          sed -i '1s;^;\n############################\nOther stuff:\n------------\n;' log/$1.log
          sed -i '1s;^;Expected: '$2'\n;' log/$1.log
          sed -i '1s;^;Got: '$3'\n;' log/$1.log
          sed -i '1s;^;\n############################\nReturn code error:\n------------\n;' log/$1.log
        fi
      }

      # compare expected output to actual output
      invoke_cmp() {
        if ! cmp -s "tmp/output/$1.txt" "tmp/expected/$1.txt" ; then
          printf "[ ${RED}FAILED!${NC} ] $1: mismatch in output\n"
      #    echo "SEE LOGFILE: ${PWD##}/log/$1.log"
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
              filename=$ret
            else
              ((count=count+1))
              file=$filename".kit" #its crazy but it works
              ../../build/compiler < "$file" >/dev/null 2>&1
              v=$?
              u="tmp/expected/$filename.txt"
              #echo $v
              if [ $v != $ret ]
              then
                printf "[ ${RED}FAILED!${NC} ] $filename: incorrect exit code ${YELLOW}[$v/$ret]${NC}\n"
              elif ! [ $v -eq 255 ]
              then
                  if test -f "${u}"; then
                    invoke_asm "$filename"
                  fi
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
  fi
fi
