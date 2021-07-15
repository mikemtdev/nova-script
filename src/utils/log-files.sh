#!/usr/bin/env bash
# author: mikemnjovu@gmail.com

# Dir for log files 
# Clean up 


if [ -e logs/ ] then
 
        cd logs/ || return
        touch log1.txt
    

else 
    mkdir logs
    cd logs || return
    
fi 