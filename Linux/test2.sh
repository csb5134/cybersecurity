#!/bin/bash
for script in $(ls ~/scripts);
do
  if [ ! -x ~/scripts/$script ]
  then
	chmod +x ~/scripts/$script
  fi
done
