#!/bin/bash
# skrypt do nauki funkcji. 
set -x

echo "Test przebiegu skrypty"
declare -f diskusage
diskusage() 
{
       	df -h;
}
diskusage | sed 's/M/megabajt/g' 
diskusage | awk '{print $2,$4,$6}'

