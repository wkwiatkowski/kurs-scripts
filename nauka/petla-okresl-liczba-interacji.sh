#!/bin/bash

# petla o okreslonej liczbie iteracji

for i in 1 2 3 4 5
do
	echo $i
done

for x in 6 7 8 9 10
do
	sleep 1
	echo $x
done

echo # Nowy wiersz
echo Start!

echo # Nowy wiersz
echo To samo + coś ekstra

for y in 11 12 13 14 15
do
	echo -n "${y}..."
	sleep 1
done
echo # Nowy wiersz 
echo Ponowy Start!
