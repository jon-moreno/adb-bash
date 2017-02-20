#!/bin/bash
#.SH DESCRIPTION
#Runs the commands I need every day

#connect
bash adb-connect.sh
adb devices

#push
#Better way to pass version?
#Should this be optional?
#bash menu2/adb-push.sh $1


#log
bash ../menu2/adb-log.sh
