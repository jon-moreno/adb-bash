#!/bin/bash
#.SH DESCRIPTION
#Automate wired installation of APK on a device
#Requires adb (duh) & debugging already on

serial=$1
version=$2

echo $serial
echo "========"

url="https://releases.libraryforall.org/android/reader/2.0.0-beta/"
apk="ARN-2.0.0-RW-rc.$version.apk"
#ARN-2.0.0-RW-rc-$version.apk
vendor="org.libraryforall.libraryforall.rw"
oldvendor="com.libraryforall"

#Verbose + Only downloads if server file is modified
wget -N $url$apk

adb -s $serial shell pm clear $vendor
adb -s $serial shell pm uninstall $vendor
adb -s $serial shell pm clear $oldvendor
adb -s $serial shell pm uninstall $oldvendor

adb -s $serial install $apk

#Our app requires networking
adb -s $serial shell svc wifi enable

exit 0
