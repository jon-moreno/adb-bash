#!/bin/bash
#.SH DESCRIPTION
#Helper program for adb-log.sh

echo $1
adb -s $1 logcat *:S ReactNative:V ReactNativeJS:V
read