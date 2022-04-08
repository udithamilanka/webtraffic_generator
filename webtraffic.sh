#!/bin/bash
echo "Welcome to web traffic generator!"

sudo ufw status
sudo ufw allow 53/tcp
sudo ufw allow 43/tcp
sudo ufw reload

secs1=300
secs2=3   # Set interval in seconds.

SECONDS=0
SECONDS2=0

while (( SECONDS < secs1 )); do
  sudo ifconfig wlp0s20f3 down
  sudo macchanger -r wlp0s20f3
  sudo ifconfig wlp0s20f3 up
  sleep 2
  #ping -c 5 www.physicshelper.tk
  wget https://physicshelper.github.io
  sleep 2
  sudo rm index.html
  #SECONDS2=0
  #while (( SECONDS2 < secs2)); do
  #  ping physicshelper.tk
  #done

done

sudo ifconfig wlp0s20f3 down
sudo macchanger -p wlp0s20f3
sudo ifconfig wlp0s20f3 up
