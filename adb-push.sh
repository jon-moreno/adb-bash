#!/bin/bash
#Automate installation of APKs
#Requires adb (duh) & debugging already on

#if device exists
#adb devices

#if success message, go to next part
#echo where fails
adb shell pm clear com.libraryforall
adb shell pm uninstall com.libraryforall

#ask for location of apk/version number. tbd
adb install ~/Downloads/ARN-2.0.0-RW-rc.12.apk

exit 0
