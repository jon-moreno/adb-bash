#!/bin/bash
#.SH DESCRIPTION
#Purges old versions of the app on a device

device=$1
vendor="org.libraryforall.libraryforall.rw"
oldvendor="com.libraryforall"

echo "Purging current installation..."
{
	adb -s $device shell pm clear $vendor
	adb -s $device shell pm uninstall $vendor
	adb -s $device shell pm clear $oldvendor
	adb -s $device shell pm uninstall $oldvendor
} &> /dev/null
echo "Clear for new install."
#case "$1" in
#		"")
#			returnvalue
#			;;
#		 
#		*)
#			runcommand
#			;;
# 
#esac