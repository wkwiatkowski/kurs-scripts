#!/bin/bash

set -x

echo -n "Podaj nazwę użytkownika: "
read USER
echo 
echo -n "Podaj imię i nazwisko: "
read IN
echo
echo -n "Podaj hasło: "
read HASLO

kat_dom='/home/'

useradd $USER -d $kat_dom$USER -m -c "$IN" -p $HASLO

smbpasswd -a $USER -s $HASLO 
