#!/bin/bash
#Automate the process of taking android screencaps with sequential filenames
#Credit to whomever wrote this
#http://blog.shvetsov.com/2013/02/grab-android-screenshot-to-computer-via.html

#Create an option for method choice
#Ensure valid file is created

#create numbering scheme and way to sequence
#probably just going to use the date and match android scheme tbh
adb shell screencap -p | sed 's/\r$//' > screen1.png

#Since the Pixel C produces invalid images with the previous command
#adb shell screencap /sdcard/Pictures/Screenshots/screen1.png
#have to make it the file from before
#Guess we'll hardcode the save location to keep things organized
#adb pull /sdcard/Pictures/Screenshots/screen1.png ~/Pictures/Android Screenshots/

exit 0
