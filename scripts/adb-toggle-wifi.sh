#Disable wifi to save battery overnight
#Credit to Jared Burrows & Igor Maia Romcy
#http://stackoverflow.com/questions/10033757/how-to-turn-off-wifi-via-adb

#Command that only works with root
#adb shell svc wifi disable

#Commands that work w.o root
#Opens/Restarts wifi settings screen
cd "${0%/*}"
./deviceparser.sh 'shell am start -a android.intent.action.MAIN -n com.android.settings/.wifi.WifiSettings'

#Simulates D-pad up, d-pad up, d-pad center
./deviceparser.sh 'shell input keyevent 19'
./deviceparser.sh 'shell input keyevent 19'
./deviceparser.sh 'shell input keyevent 23'

#Why not do keyevent 20, 23?
#Although this works when Wi-Fi is off,
#it doesn't toggle if wi-fi is on.
#Also makes this script more versatile as a toggle
#rather than a script for only on or off.