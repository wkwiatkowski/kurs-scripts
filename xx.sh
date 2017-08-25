#!/bin/bash
OLDIFS=$IFS
IFS=","

while read firstname lastname userid 
do 
	     useradd -c "${firstname} ${lastname}" -d /home/"${userid}" -G group1 -s /bin/bash "${userid}"
done < file.csv
