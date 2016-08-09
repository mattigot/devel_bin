echo "Kill hostapd+supplicant"
sudo killall wpa_supplicant hostapd
sleep 1

echo "Unload Driver"
sudo modprobe iwlwifi -r
sleep 1

echo "Load Driver"
sudo modprobe iwlwifi
sleep 2

echo "Run hostapd"
sudo hostapd /home/tester/SoftAP_hostapd_conf_files/wpa2_qwertyuiop_11n_ch6 -dd


