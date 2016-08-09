echo "Add WPA2 TKIP PSK network"

sudo wpa_cli -i wlan0 remove_network 0
sleep 2
sudo wpa_cli -i wlan0 add_network 0
sleep 1
#sudo wpa_cli -i wlan0 set_network 0 ssid '"DEV-WPA2-TKIP-PSK"'
sudo wpa_cli -i wlan0 set_network 0 ssid '"EK-Link"'
sudo wpa_cli -i wlan0 set_network 0 scan_ssid 1
sudo wpa_cli -i wlan0 set_network 0 proto WPA2
sudo wpa_cli -i wlan0 set_network 0 key_mgmt WPA-PSK
sudo wpa_cli -i wlan0 set_network 0 auth_alg OPEN
sudo wpa_cli -i wlan0 set_network 0 group TKIP
sudo wpa_cli -i wlan0 set_network 0 pairwise TKIP
sudo wpa_cli -i wlan0 set_network 0 psk '"1234567890"'
sudo wpa_cli -i wlan0 enable_network 0
sleep 4
sudo iwconfig wlan0
sleep 2
sudo dhclient wlan0
sleep 3
sudo ping 172.16.102.1 -i 0.01 -c 100 -s 1000

