#!/bin/bash
#File name set to current clock
file=`date "+%F-%H:%M:%S"`

#Reading mapping files
tail -n +1 /proc/*/maps > ~/"$file"_maps.log

#Reading ps commands
ps -eo user,pid,ppid,\%mem,\%cpu,size,cmd > ~/"$file".log

#Checking a list of .exe apps
awk 'f{print;f=0} /==>/{f=1}' ~/"$file"_maps.log | awk '{print $(NF)}' | sed '/^$/d' | sort -u > ~/app_list

#Check for app not in the system
comm -13 /nfsshare/current_app ~/app_list > new_app

#ldd apps not in the system 
ldd `paste -d " " -s ~/new_app` > ~/"$file"_ldd.log

#Perform file operations to extract library dependencies
#Remove colon :
sed 's/://g' ~/"$file"_ldd.log > ~/ldd_out.log

#Only extract the full path
sed -i 's/^.*=>\(.*\)(.*/\1/' ~/ldd_out.log

#Filter to extract the full path (extra filtering)
sed 's/\(.*\)(.*/\1/' ldd_out.log > ldd_out2.log

#Remove line not containing anything
cat ldd_out2.log | grep "[a-zA-Z]" > ldd_out3.log 

#Remove leading and trailing whitespace
sed -i 's/^[ \t]*//;s/[ \t]*$//' ldd_out3.log

#Remove any libraries not found
sed -i '/not found/d' ldd_out3.log

#rpm apps not in the system and their library dependencies
rpm -qf `paste -d " " -s ~/ldd_out3.log` > ~/"$file"_ldd_rpm.log

#Update list of available apps
cat /nfsshare/current_app new_app | sort -u > /nfsshare/current_app
