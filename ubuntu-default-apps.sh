#!/usr/bin/env sh
sudo add-apt-repository ppa:docky-core/stable
sudo add-apt-repository "deb http://repository-origin.spotify.com stable non-free"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
sudo apt-get update

sudo apt-get install -y vim
sudo apt-get install -y virtualbox
sudo apt-get install -y docky
sudo apt-get install -y compizconfig-settings-manager
sudo apt-get install -y pidgin
sudo apt-get install -y spotify-client
sudo apt-get install -y wine winetricks
sudo apt-get install -y hardinfo

