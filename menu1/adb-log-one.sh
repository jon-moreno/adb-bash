#!/bin/bash
#.SH DESCRIPTION
#Shows RN log for a device

device=$1
x-terminal-emulator -hold -e bash adb-rnlog.sh $device

exit 0