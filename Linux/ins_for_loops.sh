#!/bin/bash

#create two lists

months=(
  'jan'
  'feb'
  'march'
  'april'
  'may'
)

days=(
  'mon'
  'tues'
  'weds'
  'thurs'
)


#for month in ${months[@]};
#do
#  echo $month
#done

#for day in ${days[@]};
#do
#  echo $day
#done

#for file in $(ls);
#do
#  echo $file
#done

for num in {0..22};
do
  echo $num
done
