#!/bin/bash
#Automate the process of taking android screencaps with sequential filenames
#Credit to whomever wrote this:
##http://blog.shvetsov.com/2013/02/grab-android-screenshot-to-computer-via.html

#Create an option for method choice
#Ensure valid file is created

#Matches Android format scheme
##Screenshot_YYYY-mm-DD-HH-MM-SS.png
now=$(date +"%F-%H-%M-%S")
generated_filename="Screenshot_"$now".png"
directory=""

#The Pixel C produces invalid images with the previous command
if [ "$#" eq 1 ]; then
	
	serial=$1
	#Works with Linux + Mac
	adb -s $serial shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > $generated_filename

elif [ "$#" eq 2 ]; then

	serial=$2
	adb shell screencap /sdcard/Pictures/Screenshots/$generated_filename

	#saved_filename=$(adb shell pm ls)
	#get last file in list, should be latest screenshot
	adb pull /sdcard/Pictures/Screenshots/$saved_filename ~/Pictures/Android Screenshots/$saved_filename
else

	echo "Invalid number of parameters"
fi

#Alternative idea: screenshot on device and pull all the newest screenshots

exit 0