#!/bin/bash

#set -x

#plik='stud2015sns.csv'
#domena='sns.edu.pl'
#domena1='sns.edu.pl/'
#domena2='@sns.edu.pl'
maildir='/Maildir/'
BAZA=postfixadmin
DBUSER=admin-check

echo -n "Podaj nazwę pliku źródłowego:"
read PLIK
echo
echo -n "Podaj nazwę domeny:"
read DOMENA
echo 
echo -e "Podaj quote dla konta wyrażoną w bajtach\n"
echo -n "np. 200MB=204800000; 1,5GB=1073741824: "
read QUOTA

if [ ! -s $PLIK ]
then
	echo -e "Niestety nie mogę znaleźć pliku $PLIK\n"
	echo -e "PRZERYWAM PRACĘ\n"
	exit
fi

if ( ! psql -d $BAZA -U $DBUSER -c 'SELECT domain FROM domain' | grep $DOMENA )
then
	echo -e "Podana domena nie istnieje w systemie\n"
	echo -e "PRZERYWAM PRACĘ\n"
	exit
fi

if [ $QUOTA -eq 0 ]
then
	echo -e "Quota powinna być większa od 0, podaj poprawną wartość\n"
	echo -e "PRZERYWAM PRACĘ\n"
	exit
fi

if [ $QUOTA -gt 1073741824 ] 
then
	echo -e "Quota nie może być większa od 1,5GB, podaj poprawną wartość\n"
	echo -e "PRZERYWAM PRACĘ\n"
	exit
fi

sed -e 's/,/:/g' $PLIK >> tmp1.tmp

for i in `cut -d: -f 3 tmp1.tmp`
do
	makepasswd --clearfrom=- --crypt-md5 <<< $i >> hasla.tmp
done

awk -F : '{print $3,$2,$1}' tmp1.tmp >> tmp2.tmp
awk -F : '{print $1}' tmp1.tmp >> tmp2a.tmp

join -j 1 tmp2.tmp hasla.tmp >> tmp3.tmp

sed -e 's/[[:space:]]/:/g' tmp3.tmp >> tmp4.tmp
sed -e 's/[[:space:]]/./g' tmp2a.tmp >> tmp4a.tmp

for I in `cat tmp4.tmp`
do
	LOCAL=`echo $I | cut -d":" -f2` 		# wyłuskanie loginu
	HASLO=`echo $I | cut -d":" -f5` 		# wysłuskanie hasla
	NAZWA=`echo $I | awk -F":" '{print $3,$4}'` 	# wyłuskanie Imienia i nazwiska
	ALIAS=`echo $I | awk -F":" '{print $3,$4}' | sed 's/[[:space:]]/./g' | tr A-Z a-z`	#wyłuskanie aliasów rozbudowanych


	echo "INSERT INTO mailbox (local_part,username,name,password,maildir,domain,active,quota) VALUES ('$LOCAL','${LOCAL}@${DOMENA}','$NAZWA','$HASLO','${DOMENA}/${LOCAL}@${DOMENA}${maildir}','$DOMENA','t','$QUOTA');" >> insert-konta.sql
	
	echo "INSERT INTO alias (address,goto,domain,active) VALUES ('${LOCAL}@${DOMENA}','${LOCAL}@${DOMENA}','$DOMENA','t');" >> insert-aliasy-podst.sql
	
	echo "INSERT INTO alias (address,goto,domain,active) VALUES ('${ALIAS}@${DOMENA}','${LOCAL}@${DOMENA}','$DOMENA','t');" >> insert-aliasy.sql
	

done

echo 
echo "Plik wynikowy to: insert-konta.sql"
echo 
rm -f ./*.tmp
