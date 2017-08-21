#!/bin/bash
# This script is intended to show how to do simple substitution

shopt -s expand_aliases

alias TODAY="date"
alias UFILES="find /home -user w.kwiatkowski"

TODAYSDATE=`date`
USERFILES=`find /home -user w.kwiatkowski`

clear

echo "Today's Date: $TODAYSDATE"
echo "User's file: $USERFILES"

clear
A=`TODAY`
B=`UFILES`
echo "With Alias, TODAY is: $A"
echo "With Alias, UFILES: $B"
