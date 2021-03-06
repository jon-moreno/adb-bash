#!/bin/bash
#Automate wired installation of APKs
#Requires adb (duh) & debugging already on.

devices=$(adb devices)
version=$1

url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc.$version.apk"
#ARN-2.0.0-RW-rc-$version.apk
vendor="org.libraryforall.libraryforall.rw"
oldvendor="com.libraryforall"
counter=0

#Verbose + Only downloads if server file is modified
wget -N $url$apk

devices=$(./deviceparser.sh)

#Strip header
#devices=${devices#List of devices attached}

for device in $devices; do
	#only do commands w. serials
	
			echo $device
			echo "======="
			./adb-clear.sh $device

			#adb -s $device shell pm clear $vendor
			#adb -s $device shell pm uninstall $vendor
			#adb -s $device shell pm clear $oldvendor
			#adb -s $device shell pm uninstall $oldvendor

			adb -s $device install $apk

			#Our app requires networking
			#./adb-toggle-wifi


			#Open TCP port 5555 for wireless adb
			#Hangs on Phantom
			#adb -s $device tcpip 5555

			let counter+=1
	
done

echo "$counter devices installed"
read

exit 0

