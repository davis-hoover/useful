#!/usr/bin/env bash

sudo yum update -y yum
sudo yum install -y ntp
sudo yum install -y wget
sudo yum install -y firefox
sudo yum install -y vim
sudo yum install -y git

#sudo yum install -y zsh
sudo yum groupinstall -y "X Window System"
#sudo yum install -y gnome-desktop
#sudo yum install -y xf86-input-synaptics
