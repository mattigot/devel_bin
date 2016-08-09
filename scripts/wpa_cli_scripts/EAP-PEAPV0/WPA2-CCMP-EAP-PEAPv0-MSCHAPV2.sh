#!/bin/bash

echo "Add WPA2 CCMP EAP PEAPV0 MSCHAPV2 network"

#NETWORK=$(wpa_cli -i wlan0 add_network) || exit
SSID="EK-CCMP-EAP"
USERNAME="judith"
PASSWORD="judith"

sudo wpa_cli -i wlan0 remove_network 0
sleep 2
sudo wpa_cli -i wlan0 add_network 0
sleep 1
sudo wpa_cli -i wlan0 set_network 0 ssid \"$SSID\" || exit
sudo wpa_cli -i wlan0 set_network 0 proto WPA2 || exit
sudo wpa_cli -i wlan0 set_network 0 key_mgmt WPA-EAP || exit
sudo wpa_cli -i wlan0 set_network 0 group CCMP
sudo wpa_cli -i wlan0 set_network 0 pairwise CCMP
sudo wpa_cli -i wlan0 set_network 0 eap PEAP || exit
sudo wpa_cli -i wlan0 set_network 0 identity \"$USERNAME\" || exit
sudo wpa_cli -i wlan0 set_network 0 password \"$PASSWORD\" || exit
sudo wpa_cli -i wlan0 set_network 0 phase1 \"peaplabel=0\" || exit
sudo wpa_cli -i wlan0 set_network 0 phase2 \"auth=MSCHAPV2\" || exit

sudo wpa_cli -i wlan0 enable_network 0
sleep 4
sudo iwconfig wlan0
sleep 2
sudo dhclient wlan0
sleep 3
sudo ping 172.16.102.1 -i 0.01 -c 100 -s 1000

