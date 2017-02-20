#The Pixel C produces invalid images with the previous command
#Hope space doesn't become an issue
adb -s 6116002110 shell screencap /sdcard/Pictures/Screenshots/$1.png
#have to make it the file from before
#Guess we'll hardcode the save location to keep things organized
adb -s 6116002110 pull /sdcard/Pictures/Screenshots/$1.png ~/Pictures/Android Screenshots/$1.png


