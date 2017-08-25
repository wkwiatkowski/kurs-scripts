#!/bin/bash

#set -x

maildir='/Maildir/'
BAZA=postfixadmin
DBUSER=admin-check
#echo -n "Podaj nazwę pliku źródłowego:"
#read PLIK
#echo
echo -n "Podaj wartość dla Quoty - >=0 lub <= 200: "
read QUOTA
#echo
#echo -n "Podaj nazwę domeny:"
#read DOMENA

#if ( ! test -s $PLIK)
#then
#	echo "Niestety nie mogę znaleźć pliku $PLIK, kończę pracę"
#fi
#
#if ( ! psql -d $BAZA -U $DBUSER -c 'SELECT domain FROM domain' | grep $DOMENA )
#then
#	echo "Podana domena nie istnieje w systemie. Przerywam pracę"
#fi
#
# sprawdzenie czy quota nie jest równa 0 i nie większa niz ??
if [ $QUOTA -eq 0 ]
then
	echo "Quota powinna być większ od 0"
	exit

elif [ $QUOTA -gt 200 ]
then 
	echo "Quota nie powinna być większa niż 200"
	exit
else
	echo "Quota jest OK"
#	"Podana wartość quoty musi być większa od 0 i mnijesza od 200"
fi



