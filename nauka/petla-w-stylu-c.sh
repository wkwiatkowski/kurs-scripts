#!/bin/bash

# petla w stylu C, o okreslnej liczbie iteracji
# uruchomić w powloce SH, sprobowac to samo w BASH
# taki zapis for jest mozliwy tylko w Bash

max=10

for ((x=1; x <= max ; x++))
do
	echo -n "${x}..."
	sleep 1
done
echo	# Bez tego po zakonczeniu skryptu, sciezka i znak zachety
	# zlalyby sie w jedna calosc
echo Start!

