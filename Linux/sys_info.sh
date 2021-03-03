#!/bin/bash

files=('etc/passwd' 'etc/shadow')
for file in ${files[@]};
do
  ls -l $file
done

for user in $(ls ~/home);
do
  sudo -lU $user
done

commands=('date' 'uname-a' 'hostname -s')
for x in {0..2};
do
  results=$(${commands[$x]})\" command:"
  echo "Results of \"${commands[$x]}\" command:"
  echo $results
  echo " "
done





#variables
outFile=~/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1)
output=$HOME/research/sys_info.txt
suids=$(sudo find / -type f -perm /4000 2> /dev/null)
cpu=$(lscpu | grep CPU)


if [ ! -d ~/research ]
then
  mkdir ~/research
fi

if [ -f $outFile ]
then
  rm -f $outFile
fi

if [ $(whoami)= "root" ]
then
  echo "Do not run this script as sudo".
  exit
fi



#mkdir -p ~/research

echo "MACHINE INFO" > $outFile

#echo -e "\nToday's date is $(date)" >> $outFile
 
#echo -e "\nThis computer is running \n$(uname -a)" >> $outFile

echo -e "\nMy IP info is \n$ip" >> $outFile

#echo -e "\nMy IP info is \n$(ip address | head -9 | tail -1)" >> $outFile

#echo -e "\nMy hostname is $(hostname)" >> $outFile

echo -e "\nMy DNS servers are \n$(systemd-resolve --status | grep -i "DNS Servers")" >> $outFile

echo -e "\nMy memory usage is \n$(free -h)" >> $outFile

echo -e "\nMy CPU info is \n$(cat /proc/cpuinfo | head)" >> $outFile

echo -e "\nMy disk usage is \n$(df -h)" >> $outFile

echo -e "\nThe currently logged in users are \n$(who -a)" >> $outFile

echo -e "\nExec Files:" >> $outFile

find /home -type f -perm 777 >> $outFile

echo -e "\nTop 10 Processes" >> $outFile ps aux -m | awk {'print $1, $2, $3, $4, $11'}

