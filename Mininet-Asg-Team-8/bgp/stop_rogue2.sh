#!/bin/bash

sudo python run.py --node R4 --cmd "pgrep -f [z]ebra2-R4 | xargs kill -9"
sudo python run.py --node R4 --cmd "pgrep -f [b]gpd2-R4 | xargs kill -9"
