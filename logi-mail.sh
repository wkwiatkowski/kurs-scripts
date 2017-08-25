#!/bin/bash

set -x

# Skrypt sprawdzający login pod kątem podanego wyrażenia

plik1='/home/wk/tmp/poczta/mail.info'
plik2='/home/wk/tmp/poczta/mail.warn'
plik3='/home/wk/tmp/poczta/mail.err'

fraza='from=wkwiatko@ifispan.waw.pl'

for x in `grep -v ^# $plik1`
do
	cat $x | grep $fraza 2> /dev/null 
done

#for $fraza in $plik1, $plik2, $plik3  do
#	echo 'Wynik skanownaia pliku nr 1'
#	cat $plik1 | grep $fraza
#	echo 'Wynik skanownaia pliku nr 2'
#	cat $plik2 | grep $fraza
#	echo 'Wynik skanownaia pliku nr 3'
#	cat $plik3 | grep $fraza
#done

#echo "Podaj szukanej frazy np. from=uzytkownik@domena.pl"
#read "FRAZA"
#echo "Podaj pliki źródłowe"

#echo "Plik 1"
#read "PLIK1"

#echo 'Plik 2'
#read 'PLIK2'

#echo 'Plik 3'
#echo 'PLIK3'

#echo 'Plik 4'
#echo 'PLIK4'

#for x  in $PLIK1,$PLIK2,$PLIK3,$PLIK4 do

#	echo "Przeszukiwanie Pliku 1"
#	cat $PLIK1 | grep $FRAZA
#	echo 'Przeszukiwanie Pliku 2'
#	cat $PLIK2 grep $FRAZA
#	echo
#	echo 'Przeszukiwanie Pliku 3'
#	cat $PLIK3 grep $FRAZA
#	echo
#	echo 'Przeszukiwanie Pliku 4'
#	cat $PLIK4 grep $FRAZA

#done


