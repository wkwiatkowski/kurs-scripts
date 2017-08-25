
# nauka zmiennych, listing katalogow

KAT1=/usr/local/sbin
KAT2="/usr/local/sbin/"
POLECENIE1="ls"
POLECENIE2="$POLECENIE1 $KAT1"
POLECENIE3="$POLECENIE1 $KAT2"

echo
echo "Dwie zmienne"
$POLECENIE1 $KAT1

echo 

echo "Polecenie i zmienna" 
ls $KAT1

echo

echo "Dwie zmienne, druga zmienna zmodyfikowana"
$POLECENIE1 $KAT2

echo

echo "Polecenie i zmodyfikowana druga zmienna"
ls $KAT2

echo

echo "Zmienne w zmiennej, kat wer.1"
$POLECENIE2

echo

echo "Zmienne w zmiennej, kat. wer.2"
$POLECENIE3
