#!/bin/bash
#.SH DESCRIPTION
#Automate wired installation of APK on a device
#Requires adb (duh) & debugging already on

#echo -n "Release Candidate: "
#read version
serial=$1
version=$2

url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc.$version.apk"
#ARN-2.0.0-RW-rc-$version.apk
vendor="org.libraryforall.libraryforall.rw"
oldvendor="com.libraryforall"

#get the file
#only downloads if server file is modified
#options are:
##--continue -c
##--timestamping
##--quiet
#wget -Nq $url$apk

#Verbose version for debugging
wget -N $url$apk
#curl $url$apk

#if device exists
#adb devices

#if success message, go to next part
#echo where fails
adb -s $serial shell pm clear $vendor
adb -s $serial shell pm uninstall $vendor

#remove the old vendor
adb -s $serial shell pm clear $oldvendor
adb -s $serial shell pm uninstall $oldvendor


#ask for location of apk/version number. tbd
adb -s $serial install $apk

#Our app requires networking
#Enable Wi-Fi
adb -s $serial shell svc wifi enable

#Potentially could push Wi-Fi install if we automate device finding

exit 0
