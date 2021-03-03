#!/bin/bash

#echo "Hello World."

name='Jake'
echo "Hello $name"

echo -e "\nThis is my script.\n"

echo -e "The file in $PWD are: \n$(ls)"

echo -e "\nCopying the passwd file to your current directory.\n"

cp /etc/passwd $PWD

echo -e "The file in $PWD are now: \n$(ls)"

echo " "

echo "Have a great day!"
