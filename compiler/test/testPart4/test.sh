#!/bin/bash

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
      printf "\n\n\n /********* $file **********\\ \n"
      ../../build/compiler < "$file" >/dev/null 2>&1
      v=$?
      #echo $v
      if [ $v -eq $ret ]
      then
        echo SUCCESS
      else
        ../../build/compiler < "$file" #>/dev/null 2>&1
        echo FAIL
        echo returned $v but expected $ret
      fi
    fi
  done
done < returns.txt





: '
for file in *.kit
do
  printf "\n\n\n /********* $file **********\\ \n"
  ../../build/compiler < "$file" >/dev/null 2>&1
  v=$?
  #echo $v
  if [ $v -eq 0 ]
  then
    echo 0
  elif [ $v -eq 255 ]
  then
    echo 255
  else
    echo hej $v
  fi
done
#make clean -C ../../ -s
'
