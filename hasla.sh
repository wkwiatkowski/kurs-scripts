#!/bin/bash 

# szyfrowanie hasel

set -x

plik1='./hasla.txt'
plik2='./stud2015sns.csv'
domain='sns.waw.pl'
maildir='sns.waw.pl'
active='1'

#
#for x in `grep -v ^# $plik` ;
#do
#	openssl passwd -1 $x >> hasla-shadow.txt
#		makepasswd --clearfrom=- --crypt-md5 <<< $x >> hasla-shadow.txt

#done


for x in `cut -d, -f2 $plik2`; 
do
#	echo $x | sed "s/^/INSERT INTO \(name\,local_part\,username\,domain\,maildir\,active\,name\,password\) VALUES \(\'/g" >> tmp1.tmp 
	echo "INSERT INTO mailbox (local_part,username,domain,active,name,password) VALUES ('$x','$x@','$domain','$active','$domain" >> tmp0.tmp 
	sed -e "s/$/\/$x/; s/$/\@sns\.waw\.pl\/Maildir\//" tmp0.tmp >> tmp1.tmp

done

#	sed -e "s/4/sns\.waw\.pl\//; s/$/var\/mail\/sns\.waw\.pl\/Maildir\//g" tmp0.tmp >> tmp1.tmp


