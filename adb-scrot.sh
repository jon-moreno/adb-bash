#!/bin/bash
#Automate the process of taking android screencaps with sequential filenames
#Credit to whomever wrote this:
##http://blog.shvetsov.com/2013/02/grab-android-screenshot-to-computer-via.html

#Create an option for method choice
#Ensure valid file is created

#Matches Android format scheme
##Screenshot_YYYY-mm-DD-HH-MM-SS.png
now=$(date +"%F-%H-%M-%S")
filename="Screenshot_"$now".png"
directory=""
serial=$1
#adb shell screencap -p | sed 's/\r$//' > Screenshot_$now.png
#Works with Linux + Mac
adb -s $serial shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > $filename
#adb -s SERIALNUM shell screencap -p | sed 's/\r$//' > screen1.png
#RIGHT_NOW=$(date +"%x %r %Z")

#The Pixel C produces invalid images with the previous command
#Hope space doesn't become an issue
#adb shell screencap /sdcard/Pictures/Screenshots/$filename.png
#have to make it the file from before
#Guess we'll hardcode the save location to keep things organized
#adb pull /sdcard/Pictures/Screenshots/$filename ~/Pictures/Android Screenshots/$filename

#Alternative idea: screenshot on device and pull all the newest screenshots

#So I think I'll have to officially declare the Pixel C an edge case
#I'll take in a parameter for when I have to do scrot on Pixel C
#Otherwise do original script

exit 0
