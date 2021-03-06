#! /bin/bash

echo"
  ____  ____  ____  _        ___  _____  ____  __ __    __    ___
 /    T|    \|    \| T      /  _]/ ___/ /    T|  T  T  /  ]  /  _]
Y  o  ||  o  )  o  ) |     /  [_(   \_ Y  o  ||  |  | /  /  /  [_
|     ||   _/|   _/| l___ Y    _]\__  T|     ||  |  |/  /  Y    _]
|  _  ||  |  |  |  |     T|   [_ /  \ ||  _  ||  :  /   \_ |   [_
|  |  ||  |  |  |  |     ||     T\    ||  |  |l     \     ||     T
l__j__jl__j  l__j  l_____jl_____j \___jl__j__j \__,_j\____jl_____j by JoThreat


"




sleep 1
#scans local networks & outputs list
echo "[+] Scanning area for local networks"
sleep 1
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -s
sleep 3

# chooses target channel
echo "[+]which channel would you like to smell?> "
read -r c
sleep 5
echo "[+]smelling channel $c ...."
sleep 3

#captures packets for time limit based on user input

echo "[+] choose your packet capture time limitation > "
echo " --> 1 = 30 Seconds"
echo " --> 2 = 60 Seconds "
echo " --> 3 = 60 Minutes"
sleep 3
read -r smell
echo "[+]deep breath in ..."

if [ "$smell" = "1" ]; then
	sudo gtimeout 30 /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport en1 sniff "$c"
	sleep 3
	echo "Done Sniffing!!!"


elif [ "$smell" = "2" ]; then
	sudo gtimeout 60 /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A//Resources/airport en1 sniff "$c"
	sleep 3
	echo "Done Sniffing!!!"

else [ "$smell" = "3" ]
	sudo gtimeout 3600 /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A//Resources/airport en1 sniff "$c"
	sleep 3
	echo "Done Sniffing!!!"
fi



#shows cap file in /tmp
echo "[+]saving .cap file in tmp directory as the name below"
cd /tmp; ls -rl | egrep -o '\bairportSniff+.*.\cap'| tail -n 1; cd $HOME


