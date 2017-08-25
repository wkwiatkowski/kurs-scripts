#!/bin/bash

#
echo "Szukanie powlok w katalogach"

for check_for in sh bash ksh csh tcsh zsh ash
do
	cmd="$check_for -c exit"
	if ($cmd > /dev/null 2> /dev/null) then
		echo "Jest $check_for "
	else
		"Brak $check_for "
	fi
done

