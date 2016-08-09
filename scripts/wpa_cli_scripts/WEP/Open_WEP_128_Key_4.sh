echo "Add Open WEP128 Key 4 network"

sudo wpa_cli -i wlan3 add_network 0
sudo wpa_cli -i wlan3 set_network 0 ssid '"WEP128-STATIC-KEY4"'
sudo wpa_cli -i wlan3 set_network 0 scan_ssid 1
sudo wpa_cli -i wlan3 set_network 0 key_mgmt NONE
sudo wpa_cli -i wlan3 set_network 0 auth_alg OPEN
sudo wpa_cli -i wlan3 set_network 0 group WEP104
sudo wpa_cli -i wlan3 set_network 0 wep_key3 44444444444444444444444444
sudo wpa_cli -i wlan3 set_network 0 wep_tx_keyidx 3
sleep 1
sudo wpa_cli -i wlan3 enable_network 0
sleep 3
sudo iwconfig wlan3
sleep 2




