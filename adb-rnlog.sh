echo $1
adb -s $1 logcat *:S ReactNative:V ReactNativeJS:V
read