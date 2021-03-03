#!/bin/bash

commands=('date' 'uname -a' 'hostname -s')
for x in {0..2};
do
  results=$(${commands[$x]})
  echo "Results of \"${commands[$x]}\" command:"
  echo $results
  echo " "
done

