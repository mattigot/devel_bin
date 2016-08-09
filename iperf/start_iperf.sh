#!/bin/sh

load_driver='sudo modprobe iwlwifi'
load_supplicant='sudo wpa_supplicant -i wlan0 -c /usr/share/ix/script/test/wifi/sta_11i/DEV-OPEN-GN.conf -B'
uload_driver='sudo modprobe iwlmvm -r'
kill_supplicant='sudo killall wpa_supplicant'

#kill supplicant
echo $kill_supplicant
$kill_supplicant
#uload driver
echo $uload_driver
$uload_driver

for i in `seq 1 $1`
do
	echo "test num $i"
	#load driver
	echo $load_driver
	$load_driver
	sleep 1
	#load supplicant
	echo $load_supplicant
	$load_supplicant

	sleep 4
	#connect to perf
	iperf -c 10.12.217.172 -i1 -u -b 100m -P 4 -t 20

	#kill supplicant
	echo $kill_supplicant
	$kill_supplicant

	#uload driver
	echo $uload_driver
	$uload_driver
done


