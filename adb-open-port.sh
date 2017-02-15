devices=$(adb devices)
#Strip header
devices=${devices#List of devices attached}

for device in $devices; do
	#only do commands w. serials
	if [ $device != "device" ]
		then

			echo $device
			echo "======="
			#For all devices attached,
			#creates new window in system default terminal
			#x-terminal-emulator -hold -e ./adb-rnlog.sh $device

			#Our app requires networking
			adb -s $device shell svc wifi enable

			#Open TCP port 5555 for wireless adb
			adb -s $device tcpip 5555

			let counter+=1


	fi
done