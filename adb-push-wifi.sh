#!/bin/bash
#.SH DESCRIPTION
#Automate wireless installation of APKs
#Requires adb (duh) & debugging already on.
#Might have to make a standalone wireless version

#Establish adb connection

#Thanks udo for the grep cmd:
#http://superuser.com/a/202835/697959

#Finds all IPs on LAN. To be optimized.
ip_addresses=$(nmap -sn 192.168.0.0/24 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')

for ip in $ip_addresses; do
	adb connect $ip
done

devices=$(adb devices) #Why not grab the successful connections from before?
version=$1

#I should store these in a text file
url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc.$version.apk"
#ARN-2.0.0-RW-rc-$version.apk
vendor="org.libraryforall.libraryforall.rw"
oldvendor="com.libraryforall"
counter=0

#Verbose + Only downloads if server file is modified
wget -N $url$apk

#Strip header
devices=${devices#List of devices attached}
#Open multiple terminals platform independently
for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then

			echo $device
			echo "======="
			#For all devices attached,
			#creates new window in system default terminal
			#x-terminal-emulator -hold -e ./adb-rnlog.sh $device

			adb -s $device shell pm clear $vendor
			adb -s $device shell pm uninstall $vendor
			adb -s $device shell pm clear $oldvendor
			adb -s $device shell pm uninstall $oldvendor

			adb -s $device install $apk

			#Don't need since wi-fi is already on
			#adb -s $device shell svc wifi enable

			let counter+=1


	fi
done

echo "$counter devices installed"

#Perhaps instead of Wi-Fi connection, do Bluetooth to limit IP address range to only BT paired Android Devices
#adb devices shows device as IP address. How will I know which one is which?
#Device will appear twice if networked & plugged in

exit 0

