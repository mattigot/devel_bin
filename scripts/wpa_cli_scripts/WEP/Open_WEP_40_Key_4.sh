echo "Add Open WEP40 Key 4 network"

sudo wpa_cli -i wlan3 add_network 0
sudo wpa_cli -i wlan3 set_network 0 ssid '"WEP64-STATIC-KEY4"'
sudo wpa_cli -i wlan3 set_network 0 scan_ssid 1
sudo wpa_cli -i wlan3 set_network 0 key_mgmt NONE
sudo wpa_cli -i wlan3 set_network 0 auth_alg OPEN
sudo wpa_cli -i wlan3 set_network 0 group WEP40
sudo wpa_cli -i wlan3 set_network 0 wep_key3 4444444444
sudo wpa_cli -i wlan3 set_network 0 wep_tx_keyidx 3
sleep 1
sudo wpa_cli -i wlan3 enable_network 0
sleep 4
sudo iwconfig wlan3

