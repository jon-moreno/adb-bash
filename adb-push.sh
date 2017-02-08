#!/bin/bash
#Automate installation of APKs
#Requires adb (duh) & debugging already on

devices=$(adb devices)
version=$1

#I should store these in a text file
url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc-$version.apk"
vendor="org.libraryforall.libraryforall.rw"
oldvendor="com.libraryforall"

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
			#For all devices attached,
			#creates new window in system default terminal
			#x-terminal-emulator -hold -e ./adb-rnlog.sh $device

			adb -s $device shell pm clear $vendor
			adb -s $device shell pm uninstall $vendor

			#remove the old vendor
			adb -s $device shell pm clear $oldvendor
			adb -s $device shell pm uninstall $oldvendor


			adb -s $device install $apk

			#Our app requires networking
			adb -s $device shell svc wifi enable

			


	fi
done

exit 0

