#!/bin/bash

# testowanie polecenia read

echo "Podaj swoje imię"
read "IMIE"
echo "Podaj swoje nazwisko"
read "NAZW"
echo
wiadomosc="Zatem masz na imię $IMIE $NAZW, witaj  w naszym wspanialym"
echo "$wiadomosc instytucie swietlanej przyszlosci :) "
