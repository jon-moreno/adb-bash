#!/bin/bash
#.SH DESCRIPTION
#Finds devices then returns values or runs commands

cd "${0%/*}"

cmd=$1

#Find devices using adb then strip header
devices=$(adb devices)
devices=${devices#List of devices attached}

function returnvalue () {
for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then
			#Acts as a return value for calling script
			echo $device
	fi
done
}

function runcommand () {
for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then

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
}

case "$1" in
		"")
			returnvalue
			;;
		 
		*)
			runcommand
			;;
 
esac