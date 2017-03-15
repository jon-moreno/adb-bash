#!/bin/bash
#.SH DESCRIPTION
#Shows RN log for all connected devices

#need to set dynamic path to adb-rnlog
#doesn't work unless shell already in path
#possibility to send working directory in gnome-terminal
cd "${0%/*}"
echo "${0%/*}"
devices=$(./deviceparser.sh)

for device in $devices; do
	x-terminal-emulator -hold -e ./adb-rnlog.sh $device
	#x-terminal-emulator -hold -e echo "$device;adb -s $1 logcat *:S ReactNative:V ReactNativeJS:V;read"
done

exit 0