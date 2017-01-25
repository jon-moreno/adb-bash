#!/bin/bash
#Automate installation of APKs
#Requires adb (duh) & debugging already on

#if device exists
#adb devices

#if success message, go to next part
#echo where fails
adb shell pm clear com.libraryforall
adb shell pm uninstall com.libraryforall

#get the file
#wget https://releases.libraryforall.org/android/reader/2.0.0-beta/ARN-2.0.0-RW-rc.12.apk

#ask for location of apk/version number. tbd
adb install ~/Downloads/ARN-2.0.0-RW-rc.12.apk

#Our app requires networking
adb shell svc wifi enable

#Potentially could push Wi-Fi install if we automate device finding

exit 0
