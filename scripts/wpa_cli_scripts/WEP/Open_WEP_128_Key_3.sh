echo "Add Open WEP128 Key 3 network"

sudo wpa_cli -i wlan3 add_network 0
sudo wpa_cli -i wlan3 set_network 0 ssid '"WEP128-STATIC-KEY3"'
sudo wpa_cli -i wlan3 set_network 0 scan_ssid 1
sudo wpa_cli -i wlan3 set_network 0 key_mgmt NONE
sudo wpa_cli -i wlan3 set_network 0 auth_alg OPEN
sudo wpa_cli -i wlan3 set_network 0 group WEP104
sudo wpa_cli -i wlan3 set_network 0 wep_key2 33333333333333333333333333
sudo wpa_cli -i wlan3 set_network 0 wep_tx_keyidx 2
sleep 1
sudo wpa_cli -i wlan3 enable_network 0
sleep 3
sudo iwconfig wlan3





