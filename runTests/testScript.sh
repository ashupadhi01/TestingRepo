#!/bin/bash

./../test.sh
tail -n 5 currOutput.txt > tempNew.txt
tail -n 5 prevOutput.txt > tempOld.txt
diff -q tempNew.txt tempOld.txt
status=$?
rm tempNew.txt tempOld.txt
if [ $status -eq 0 ]; then
  echo "Files are same."
  exit 0
  
else
  echo "Files are not same."
  exit 1
fi