#!/bin/sh

#####
## Script taken from
#####

# install figlet to enable ASCII art
sudo apt-get install figlet

# create directory
mkdir /etc/update-motd.d/

# copy all files into place
mv motd/* /etc/update-motd.d/

# make files executable
chmod +x /etc/update-motd.d/*

# remove MOTD file
rm /etc/motd

# symlink dynamic MOTD file
ln -s /var/run/motd /etc/motd
