#!/bin/bash
#Automate installation of APKs
#Requires adb (duh) & debugging already on

url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc.15.apk"
vendor="org.libraryforall.libraryforall.rw"
#"com.libraryforall"

#get the file
#only downloads if server file is modified
#options
##--timestamping
##--quiet
wget -Nq $url$apk


#if device exists
#adb devices

#if success message, go to next part
#echo where fails
adb shell pm clear $vendor
adb shell pm uninstall $vendor

#ask for location of apk/version number. tbd
adb install $apk

#Our app requires networking
#Enable Wi-Fi
adb shell svc wifi enable

#Potentially could push Wi-Fi install if we automate device finding

exit 0
