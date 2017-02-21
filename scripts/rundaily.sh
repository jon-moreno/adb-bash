#!/bin/bash
#.SH DESCRIPTION
#Runs the commands I need every day

#Will implement when I remember to unlock the devices manually 
#so they appear on the network
#
#bash adb-connect.sh
#adb devices

#push
#Better way to pass version?
#Should this be optional?
x-terminal-emulator -hold -e ./adb-push.sh $1
#x-terminal-emulator -hold -e ./ztest.sh

#log
#echo "Log"
x-terminal-emulator -hold -e ./adb-log.sh

#read