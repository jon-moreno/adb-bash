#!/bin/bash
#.SH DESCRIPTION
#Runs the commands I need every day

#Will implement when I determine what makes
#device appear on the network
#
#adb devices
#bash adb-connect.sh
#adb devices

#push
#Better way to pass version?
#Should this be optional?
#x-terminal-emulator -hold -e ./adb-push.sh $1
x-terminal-emulator -hold -e ./adb-push-wired.sh $1

#log
#echo "Log"
x-terminal-emulator -hold -e ./adb-log.sh

#read
