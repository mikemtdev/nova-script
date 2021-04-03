#! /usr/bin/bash

Windows=127
Phone=64
Other=63
Lowest=6
RED='\033[0;41;30m'
STD='\033[0;0;39m'

function WindowsFun(){
   
        sudo bash -c 'echo 127 > /proc/sys/net/ipv4/ip_default_ttl'
        echo "TTL Changed to 127"
        
   
    
    
}
function PhoneFun()
{
    ]
  
        sudo bash -c 'echo 64 > /proc/sys/net/ipv4/ip_default_ttl'
        echo "TTL Changed to 63"
        
 
    
    
}

function OtherFun(){
   
        sudo bash -c 'echo 63 > /proc/sys/net/ipv4/ip_default_ttl'
        echo "TTL Changed to 63"
        
   
    
  
}
function LowestFun(){
   
        sudo bash -c 'echo 46 > /proc/sys/net/ipv4/ip_default_ttl'
        echo "TTL Changed to 46"
        

}
show_menu(){
    # clear
    echo "Choose TTl value: 1-5
    1.Windows (127)
    2.Phone (64)
    3.Other (63)
    4.Lower (46)
    5.exit

"

}

read_options(){
    local EnteredChoice
read -p "Enter Choice " EnteredChoice
case $EnteredChoice in 
    1) WindowsFun ;;
    2) PhoneFun ;;
    3) OtherFun ;;
    4) LowestFun ;;
    5) exit 0;;
    *) echo -e "${RED}Error...${STD}" && sleep 2
esac
}
while true
    do
        show_menu
        read_options
    done