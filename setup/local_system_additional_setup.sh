#!/usr/bin/env bash

sudo apt update
# install additional programs.
sudo apt install gnome-tweaks vim-gtk pavucontrol preload

# Computer stores the time in a hardware clock on its motherboard. 
# The clock keeps track of time, even when the computer is off. 
# By default, Windows assumes the time is stored in local time, 
# while Linux assumes the time is stored in UTC time and applies an offset. 
# This leads to one of your operating systems showing the wrong time in a 
# dual boot situation. To fix this, make Linux use local time as well.
timedatectl set-local-rtc 1 --adjust-system-clock

# enable tmpfs mount
sudo cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/ 
sudo systemctl enable tmp.mount
sudo systemctl disable bluetooth

# setup tlp
sudo apt install tlp tlp-rdw
sudo tlp start
sudo systemctl enable tlp.service