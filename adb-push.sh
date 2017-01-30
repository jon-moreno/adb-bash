#!/bin/bash
#Automate installation of APKs
#Requires adb (duh) & debugging already on

url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc.13.apk"
vendor="com.libraryforall"

#get the file
echo $url$apk
wget -N $url$apk

#if device exists
#adb devices

#if success message, go to next part
#echo where fails
adb shell pm clear $vendor
adb shell pm uninstall $vendor

#ask for location of apk/version number. tbd
adb install $apk

#Our app requires networking
adb shell svc wifi enable

#Potentially could push Wi-Fi install if we automate device finding

exit 0
