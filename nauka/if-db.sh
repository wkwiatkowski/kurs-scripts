#!/bin/bash

set -x

maildir='/Maildir/'
BAZA=postfixadmin
DBUSER=admin-check

#echo -n "Podaj nazwę domeny:"
#read DOMENA
echo
echo -n "Podaj quote"
read QUOTA

#echo -n "Podaj quote dla konta wyrażoną w bajtach (200MB=204800000):"
#read QUOTA

#if ( psql -d $BAZA -U $DBUSER -c 'SELECT domain FROM domain' | grep $DOMENA )
#then
#		echo "Podana domena istnieje w systemie, pracuję dalej"
#else
#		echo "Podana domena nie istnieje w systemie. Przerywam pracę"
#fi

if [ $QUOTA -gt 0 -a $QUOTA -lt 10 ]
then
	echo "Quota jest poprawna"
else
	echo "Quota jest niepoprawna"
fi

