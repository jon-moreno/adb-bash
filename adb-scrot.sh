#!/bin/bash
#Automate the process of taking android screencaps with sequential filenames
#Credit to whomever wrote this:
##http://blog.shvetsov.com/2013/02/grab-android-screenshot-to-computer-via.html

#Create an option for method choice
#Ensure valid file is created

#Matches Android format scheme
##Screenshot_YYYY-mm-DD-HH-MM-SS.png
frmt=date +"%F-%H-%M-%S"
adb shell screencap -p | sed 's/\r$//' > Screenshot_$frmt.png
#adb -s SERIALNUM shell screencap -p | sed 's/\r$//' > screen1.png
#RIGHT_NOW=$(date +"%x %r %Z")

#Since the Pixel C produces invalid images with the previous command
#adb shell screencap /sdcard/Pictures/Screenshots/screen1.png
#have to make it the file from before
#Guess we'll hardcode the save location to keep things organized
#adb pull /sdcard/Pictures/Screenshots/screen1.png ~/Pictures/Android Screenshots/

#Alternative idea: screenshot on device and pull all the newest screenshots

exit 0
