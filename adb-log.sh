#!/bin/bash
#adb -s $1 logcat *:S ReactNative:V ReactNativeJS:V
#Open multiple terminals
#Platform independently

#for device in devices
devices=$(adb devices)
#device_string=""
#cmd="gnome-terminal"
#Strip header
devices=${devices#List of devices attached}

for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then
			#store in string
			#put string into array
			#will automatically parse
			#store in array

			#device_string="$device_string $device "

			#For all devices attached,
			#creates new window in system default terminal

			#need to set dynamic path to adb-rnlog
			#doesn't work unless shell already in path
			#possibility to send working directory in gnome-terminal
			x-terminal-emulator -hold -e bash adb-rnlog.sh $device
			
			#Will open one at a time
			#xterm -hold -e ./adb-rnlog.sh $device
			
			#gnome-terminal, which doesn't want to open tabs
			#x-terminal-emulator --tab -hold -e ./adb-rnlog.sh $device x-terminal-emulator -hold --tab
			#gnome-terminal --tab -e ./adb-rnlog.sh $device --tab
	fi
done
exit 0
#echo $device_string
#device_arr=($device_string)
#counter=0
#echo ${#device_arr[*]}
#run command for array length

#while counter < length, counter++
#for
#append string 
## --tab -e ./adb-rnlong.sh arr[counter]
#run command using string
##gnome terminal $thestring

#while [ $counter -lt  ${#device_arr[*]} ]; do
#	echo $cmd
#	cmd="$cmd --tab-with-profile=Hold -e ./adb-rnlog.sh ${device_arr[counter]}"
#	let counter=counter+1
#done
#
#$cmd
