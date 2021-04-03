#! /usr/bin/bash
# author: mikemnjovu@gmail.com


# Run this Script as super user 

GITREPO="https://github.com/Mikemnjovu/Badhostsfile.git"

git clone $GITREPO

cd Badhostsfile

# Makeing copy of hosts file as a backup

cp /etc/hosts /etc/hosts.bk

# Pasting the contents of the badhosts.txt to the hosts on system 
sudo -S cat Badhosts.txt >> /etc/hosts 

# Move out of the bad host folder to the root
cd ..

# Move Badhosfile folder to temporary folder

mv Badhostsfile tempfiles/
exit
