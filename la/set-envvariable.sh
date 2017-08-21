#!/bin/bash

clear

echo "Script which will set a few env. variable"
echo ""

echo "Set up a start of the script"
export STARTOFSCRIPT=`DATE +%T`
echo ""

echo "set up a MYUSERNAME Waldek"
export MYUSERNAME="Waldek"
echo ""

echo "set up MYPASSWORD"
export MYPASSWORD="123456"
echo ""

echo "Set up a end of the script"
export ENDOFSCRIPT=`DATE +%T`

echo $STARTOFSCRIPT 
echo $MYUSERNAME
echo $MYPASSWORD
echo $ENDOFSCRIPT
