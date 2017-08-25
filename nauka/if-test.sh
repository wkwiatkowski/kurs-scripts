#!/bin/bash

# nauka, if i instrukcja test

if (test -s ../zrodlo/stud2015sns.csv)
then
	echo "Plik istnieje i nie jest pusty"
else
	echo "Brak pliku w kat. nadrzednym..."
fi

