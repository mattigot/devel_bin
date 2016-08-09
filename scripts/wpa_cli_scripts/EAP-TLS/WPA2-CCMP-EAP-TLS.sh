#!/bin/bash

echo "Add WPA2 CCMP EAP TLS network"

#NETWORK=$(wpa_cli -i wlan0 add_network) || exit
SSID="EK-CCMP-EAP"
USERNAME="judith"
CA_CERT="/etc/wpa_supplicant/certs/freeradius-ca.der"
PRIVATE_KEY="/etc/wpa_supplicant/certs/freeradius-client.p12"
PRIVATE_KEY_PASSWD="whatever"

sudo wpa_cli -i wlan0 remove_network 0
sleep 2
sudo wpa_cli -i wlan0 add_network 0
sleep 1
sudo wpa_cli -i wlan0 set_network 0 ssid \"$SSID\" || exit
sudo wpa_cli -i wlan0 set_network 0 proto WPA2 || exit
sudo wpa_cli -i wlan0 set_network 0 key_mgmt WPA-EAP || exit
sudo wpa_cli -i wlan0 set_network 0 group CCMP
sudo wpa_cli -i wlan0 set_network 0 pairwise CCMP
sudo wpa_cli -i wlan0 set_network 0 eap TLS || exit
sudo wpa_cli -i wlan0 set_network 0 identity \"$USERNAME\" || exit
sudo wpa_cli -i wlan0 set_network 0 ca_cert \"$CA_CERT\" || exit
sudo wpa_cli -i wlan0 set_network 0 private_key \"$PRIVATE_KEY\" || exit
sudo wpa_cli -i wlan0 set_network 0 private_key_passwd \"$PRIVATE_KEY_PASSWD\" || exit

sudo wpa_cli -i wlan0 enable_network 0
sleep 4
sudo iwconfig wlan0
sleep 2
sudo dhclient wlan0
sleep 4
sudo ping 172.16.102.1 -i 0.01 -c 100 -s 1000

