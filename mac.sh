#!/bin/bash
clear
echo "Netz nach MAC-Adressen durchsuchen"
echo "Netzadresse eingeben(default 192.168.1.x):" 
read NET

if ["$NET" = ""]
then 
NET=192.168.1
else
echo "Fehler"
fi

echo "IP-Bereich von:"
read a
echo "IP-Bereich bis:" 
read b

clear

for (( x=$a; $x <= $b; x++ ))
do
if 
ping -f -c1 -W1 $NET.$x 2>&1 >/dev/null
then
	
	MAC=`arp -n $NET.$x | tail -1 | cut -c 21-37`
  	echo "IP-Adresse:" $NET.$x 
  	echo "MAC-Adresse:" $MAC
  	echo "-----------------------"

else
	echo "IP-Adresse: " $NET.$x "nicht erreichbar" &>/dev/null
fi
	#p=`echo "scale=0; ($x*100)/$b" | bc`
	#echo $p "%"

done

#for i in `jot - 100 110`; do ping -c1 192.168.1.$i ; done
#ping -c1 $NET.$x 2>&1 >/dev/null
	
# OLD
#if 
#
#then
#	clear
#	echo "IP-Adresse:" $NET.$x
#	MAC=`arp -n $NET.$x | tail -1 | cut -c 20-37`
#	echo "MAC-Adresse:" $MAC
#else
#	echo "IP-Adresse nicht erreichbar"
#fi
