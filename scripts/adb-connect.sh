#!/bin/bash
#.SH DESCRIPTION
#Finds and connects Android devices wirelessly

ip_addresses=$(nmap -sn 192.168.0.0/24 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')

for ip in $ip_addresses; do
	adb connect $ip
done