#! /usr/bin/bash

CONFIG=~$HOME/.config-nova
touch  ~/.config-nova
RED='\033[0;41;30m'
STD='\033[0;0;39m'
if [[ -e $CONFIG  ]]
then 
echo "File alredy exist"
echo "Configuration file for nova-script " >> $CONFIG
else
echo "Configuration file for nova-script " >> ~/.config-nova

fi 


function homebrew(){
 echo "Pkg:homebrew" >> ~/.config-nova
 }
 
  function apt(){
 echo "Pkg:apt" >> ~/.config-nova
 }
 
  function apt-fast(){
 echo "Pkg:apt-fast" >> ~/.config-nova
 }
 
 function  dnf(){
 echo "Pkg:dnf" >> ~/.config-nova
 }
show_menu(){
      # clear
  echo "
 Choose pakage Installer
 1) Homebrew
 2) Apt
 3) Apt-fast
 4) Dnf

 "}
 


read_options(){
local EnteredChoice
read -p "Enter Choice " EnteredChoice
case $EnteredChoice in 
    1) homebrew ;;
    2) apt ;;
    3) apt-fast ;;
    4) dnf ;;
    5) exit 0;;
    *) echo -e "${RED}Error...${STD}" && sleep 2
esac
}

while true
    do
        show_menu
        read_options

    done


