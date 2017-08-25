#!/bin/bash
# skrypt do nauki funkcji. 
# Wylistowanie procesów, wybranie jednego i poinformowanie użytkownika

#set -x

#echo "Test przebiegu skryptu"

#proces="$1"
# lub interaktywnie
echo -n "Podaj nazwę procesu: "
read PROCES

tmp="/tmp/psinfo.tmp"

psinfo() 
{
       	ps -aux | grep $PROCES 
}

iloscproc()
{
		wc -l $tmp
}

PID=`psinfo | awk '{print $2}'`
CPU=`psinfo | awk '{print $3}'`
RAM=`psinfo | awk '{print $4}'`

echo -n "Ilość procesów \"${PROCES}\": "  
echo "`psinfo | wc -l` szt."

echo "\"$PROCES\" działa: Nr proc., % CPU, % RAM" 
#echo "%CPU:" ; psinfo | awk '{print $3}'
echo -e "PID, \t%CPU, \t%RAM"

#printf "$PID\t $CPU\t $RAM\n"

echo "################################"
echo
#psinfo | awk '{ FS = "\t" ; print $2,FS,$3,FS,$4}'
psinfo | awk '{ print $2,FS,FS,$3,FS,FS,$4}'

rm -f $tmp
