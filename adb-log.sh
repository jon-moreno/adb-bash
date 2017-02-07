#adb -s $1 logcat *:S ReactNative:V ReactNativeJS:V

#Open multiple terminals
#Platform independently

#for device in devices
devices=$(adb devices)
div="~~~~"

#Strip header
devices=${devices#List of devices attached}

for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then
			#store in array

			#For all devices attached,
			#creates new window in system default terminal
			#x-terminal-emulator -hold -e ./adb-rnlog.sh $device
			
			#Will open one at a time
			#xterm -hold -e ./adb-rnlog.sh $device
			
			#gnome-terminal, which doesn't want to open tabs
			#x-terminal-emulator --tab -hold -e ./adb-rnlog.sh $device x-terminal-emulator -hold --tab
			#gnome-terminal --tab -e ./adb-rnlog.sh $device --tab
	fi
done


#run command for array length

#while counter < length, counter++
#append string 
## --tab -e ./adb-rnlong.sh arr[counter]
#run command using string
##gnome terminal $thestring

exit 0
