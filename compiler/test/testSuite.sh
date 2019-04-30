#!/bin/bash
#make clean -C ../ -s
make -C ../
reset
printf "\n<<<<<< STARTING TEST SUITE >>>>>>\n\n"

#find file1.dat -type d -name target -execdir testSuite.sh \;

dir="/testFolder/*"
invoke_cmp() {
  if cmp -s "$dir/$ret1.kit" "$dir/$ret2.kit" ; then
    echo "PASSED!"
  else
    echo "FAILED!"
  fi
}

for f in $dir
do
    if [ -d "$f" ]
    then
        for ff in $f/*
        do
            echo "Processing $ff"
        done
    else
        echo "starting test: $f"
        invoke_cmp
    fi
done


#invoke_tests
invoke_tests () {
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
}
