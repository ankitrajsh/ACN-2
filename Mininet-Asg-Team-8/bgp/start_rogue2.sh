#!/bin/bash

echo "Killing any existing rogue AS"
./stop_rogue2.sh

echo "Starting rogue AS"
sudo python run.py --node R4 --cmd "/usr/lib/quagga/zebra -f conf/zebra2-R4.conf -d -i /tmp/zebra2-R4.pid > logs/R4-zebra2-stdout"
sudo python run.py --node R4 --cmd "/usr/lib/quagga/bgpd -f conf/bgpd2-R4.conf -d -i /tmp/bgpd2-R4.pid > logs/R4-bgpd2-stdout"
