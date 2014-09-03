#!/bin/sh

#####
## Script taken from
#####

PROJECT="debian-dynamic-motd"
BRANCH="master"
URL="https://github.com/DisruptiveMind/$PROJECT"
FOLDER=$PROJECT

# install figlet to enable ASCII art
sudo apt-get install figlet

# create directory
rm -rf /etc/update-motd.d/*
mkdir -f /etc/update-motd.d/

# create the paths
rm -rf "$BRANCH**"
wget "$URL/archive/$BRANCH.zip" ; unzip "$BRANCH.zip"

# copy all files into place
cd $FOLDER ; mv motd/* /etc/update-motd.d/

# make files executable
chmod +x /etc/update-motd.d/*

# remove MOTD file
rm -f /etc/motd

# symlink dynamic MOTD file
ln -sf /var/run/motd /etc/motd
