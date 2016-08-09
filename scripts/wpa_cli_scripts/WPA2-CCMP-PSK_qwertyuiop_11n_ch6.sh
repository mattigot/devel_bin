echo "Add WPA2 CCMP PSK network"

sudo wpa_cli -i wlan0 remove_network 0
sleep 2
sudo wpa_cli -i wlan0 add_network 0
sleep 1
sudo wpa_cli -i wlan0 set_network 0 ssid '"SoftAP-wpa2-qwertyuiop-11n-ch6"'
#sudo wpa_cli -i wlan0 set_network 0 scan_ssid 1
sudo wpa_cli -i wlan0 set_network 0 proto WPA2
sudo wpa_cli -i wlan0 set_network 0 key_mgmt WPA-PSK
sudo wpa_cli -i wlan0 set_network 0 auth_alg OPEN
sudo wpa_cli -i wlan0 set_network 0 group CCMP
sudo wpa_cli -i wlan0 set_network 0 pairwise CCMP
sudo wpa_cli -i wlan0 set_network 0 psk '"qwertyuiop"'
sudo wpa_cli -i wlan0 enable_network 0
sleep 4
sudo iwconfig wlan0
sleep 2
sudo dhclient wlan0
sleep 3
sudo ping 172.16.102.1 -i 0.01 -c 100 -s 1000

