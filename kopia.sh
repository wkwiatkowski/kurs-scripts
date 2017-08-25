#!/bin/bash
# Skrypt wykonujący kopię testowego kat. $HOME/tmp

set -x

home="/home/wk/"
dysk="/dev/sdb1"
ddysk="/home/wk/dysk-zew"

chdysk() {
	cat /etc/mtab | grep dysk-zew > /dev/null;
}

# Jeden z dwóch wariantów
# 1
# if (cat /etc/mtab | grep dysk-zew > /dev/null) then
# 2
if (chdysk)  then
	umount $ddysk

else 
	mount $dysk -t auto $home/dysk-zew

ls --color $ddysk
#ls --color $HOME/dysk-zew

fi





