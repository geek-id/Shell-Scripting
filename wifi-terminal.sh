#!/bin/bash

# Bash Scripting for connect wifi via terminal
# created by github.com/geek-id

wifiadpt=$(ifconfig -a | sed 's/[ \t].*//;/^\(lo\|\)$/d' | grep "^wlp[0-9]s[0-9]\+")

echo -e "Wi-Fi Adapter available: "
echo $wifiadpt
echo -e ""
echo -n "Select Wi-Fi adapter: "
read int
regex='[-A-Za-z0-9\+&@#/%=~_|]'
if [[ $int =~ $regex ]] && [[ $int == $wifiadpt ]];then

	state=$(cat /sys/class/net/"$int"/operstate)

	if [ $state == 'up' ];then
		echo "$int Ready"
	else
		ifconfig "$int" up
	fi
	
else
	echo -e "Wrong input"
fi


# state=$(cat /sys/class/net/"$int"/operstate)

# if [ $state == 'up' ];then
# 	echo "$int Ready"
# else
# 	ifconfig "$int" up
# fi
clear;

echo -e "\nAvailable Wi-Fi : "
iwlist "$int" scan | awk -F ":" '/ESSID:/ {print $2;}'
echo -e ""
echo -n "Select Wi-Fi: "
read wifi
regex='[-A-Za-z0-9\+&@#/%=~_|]'
if [[ $wifi =~ $regex ]];then
	iwconfig "$int" ESSID "$wifi"
else
	echo -e "Wrong input"
fi
clear ;

wpafolder=/etc/wpa
wpafile=wpa.conf

if [ -d $wpafolder ];then
	echo -e "Directory wpa available"
	cd $wpafolder
	if [ -e $wpafile ];then
		#cat $wpafolder/$wpafile
		echo -e "$wpafile is available"
	else 
		cd $wpafolder && touch $wpafile && cat > $wpafile << EOF
### WPA Passphrase ###
EOF
	fi
else
	mkdir $wpafolder
	if [ -e $wpafile ];then
		cat $wpafolder/$wpafile
	else 
		cd $wpafolder && touch $wpafile && cat > $wpafile << EOF
### WPA Passphrase ###
EOF
	fi
	echo "Folder $wpafolder & $wpafile was created"
fi

#echo -n "Wi-Fi WPA Password: "
#read -s pass
pass="Wi-Fi WPA Password: "
while IFS= read -p "$pass" -r -s -n 1 char
do
	if [[ $char == $'\0' ]];then
		break
	fi
	pass='*'
	password+="$char"
done
echo -e "\n"

wpa=$wpafolder/$wpafile
wpa_passphrase $wifi $pass > $wpa

wpa_supplicant -D wext -i "$int" -c/"$wpa" -B

dhclient $int