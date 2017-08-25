#!/bin/bash

# set -x

#plik='stud2015sns.csv'
#domena='sns.edu.pl'
#domena1='sns.edu.pl/'
#domena2='@sns.edu.pl'
maildir='/Maildir/'

echo -n "Podaj nazwę pliku źródłowego:"
read PLIK
echo
echo -n "Podaj nazwę domeny:"
read DOMENA
echo 

sed -e 's/,/:/g' $PLIK >> tmp1.tmp

for i in `cut -d: -f 3 tmp1.tmp`
do
	makepasswd --clearfrom=- --crypt-md5 <<< $i >> hasla.tmp
done

awk -F : '{print $3,$2,$1}' tmp1.tmp >> tmp2.tmp

join -j 1 tmp2.tmp hasla.tmp >> tmp3.tmp

sed -e 's/[[:space:]]/:/g' tmp3.tmp >> tmp4.tmp

for I in `cat tmp4.tmp`
do
	LOCAL=`echo $I | cut -d":" -f2` # wyłuskanie loginu
	HASLO=`echo $I | cut -d":" -f5` # wysłuskanie hasla
	NAZWA=`echo $I | awk -F":" '{print $3,$4}'` # wyłuskanie Imienia i nazwiska

	echo "INSERT INTO alias (address,goto,domain,active) VALUES ('$LOCAL@$DOMENA','$NAZWA','$HASLO','$DOMENA/$LOCAL@$DOMENA$maildir','$DOMENA','t','$QUOTA')" >> insert-konta.sql

done

echo 
echo "Plik wynikowy to: insert-konta.sql"
echo 
rm -f ./*.tmp
