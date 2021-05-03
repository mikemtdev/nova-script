#! /usr/bin/bash
# author: mikemnjovu@gmail.com


# Run this Script as super user



cd tempfiles/

# GITREPO="https://github.com/Mikemnjovu/Badhostsfile.git"
# git clone $GITREPO

cd Badhostsfile

# Makeing copy of hosts file as a backup

# sudo cp /etc/hosts /etc/hosts.bk

# Pasting the contents of the badhosts.txt to the hosts on system
# sudo cat -S Badhosts.txt >> hosts

sudo -s cat -s Badhosts.txt >> /etc/hosts

# Move out of the Badhosts folder to the root
cd ..
# Move out of the tempfiles folder to the root
cd ..
