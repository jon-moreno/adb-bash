#!/bin/bash
#.SH DESCRIPTION
#Contains the loop for finding devices

cmd=$1
devices=$(adb devices)

#Strip header
devices=${devices#List of devices attached}

for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then

			#module specific code

			echo adb -s $device $cmd
			echo "=================="
			adb -s $device $cmd

			#adb -s $device shell pm clear $vendor
			#adb -s $device shell pm uninstall $vendor
			#adb -s $device shell pm clear $oldvendor
			#adb -s $device shell pm uninstall $oldvendor

			#adb -s $device install $apk

			#Our app requires networking
			#adb -s $device shell svc wifi enable


			#Open TCP port 5555 for wireless adb
			#Hangs on Phantom
			#adb -s $device tcpip 5555

			#let counter+=1
	fi
done
