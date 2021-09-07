#! /usr/bin/bash

Windows=127
Phone=64
Other=63
Lowest=46
RED='\033[0;41;30m'
STD='\033[0;0;39m'


function set-ttl() {
    #---- Local Variables ----
local TTLPassed=$1

    # This section contains all of the variables you want to use within your function. Be careful not to inadvertently name any of your variables the same as any existing environment variables, as bash scripts do not have function or block scope.
    # If you need scoping, consider using a subshell.

        # ← put your local variables here.

    #---- Function Logic ----

  sudo bash -c "echo ${TTLPassed} > /proc/sys/net/ipv4/ip_default_ttl"
        echo "TTL Changed to ${TTLPassed}"


    # This section contains all of the commands you want to run.

        # ← put your commands here.

    #-------- Cleanup --------

    # This section contains all of the code you need to unset your local variables.

        # ← unset your local variables here.

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
read -rp "Enter Choice " EnteredChoice
case $EnteredChoice in 
    1) set-ttl "$Windows" ;;
    2) set-ttl "$Phone" ;;
    3) set-ttl "$Other" ;;
    4) set-ttl "$Lowest" ;;
    5) exit 0;;
    *) echo -e "${RED}Error...${STD}" && sleep 2
esac
}
while true
    do
        show_menu
        read_options
    done