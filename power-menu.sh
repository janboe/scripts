#!/bin/sh
sudo $(echo -e "slock\npm-suspend\npm-hibernate\npm-suspend-hybrid\nhalt\nreboot" | dmenu -p "power")
