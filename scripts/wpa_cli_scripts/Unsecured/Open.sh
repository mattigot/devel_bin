echo "Add Open-Unsecured network"

sudo wpa_cli -i wlan0 remove_network 0
sleep 2
sudo wpa_cli -i wlan0 add_network 0
sleep 1
sudo wpa_cli -i wlan0 set_network 0 ssid '"11G_OPEN_CH6"'
sudo wpa_cli -i wlan0 set_network 0 scan_ssid 1
sudo wpa_cli -i wlan0 set_network 0 key_mgmt NONE
sudo wpa_cli -i wlan0 set_network 0 auth_alg OPEN
sudo wpa_cli -i wlan0 enable_network 0
sleep 4
sudo iwconfig wlan0
sleep 2
sudo dhclient wlan0
sleep 3


