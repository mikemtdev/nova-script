#!/usr/bin/env bash
# author: mikemnjovu@gmail.com

#source lib/bash_utility.sh
#source lib/src/os.sh





passedCommand=$1
#if [ -n $3 ] 
#then
	if [[ "$3" == "common" || "$3" == "dev" || "$3" == 'dev-setup' ]]
	then 
	packages=$3
	fi

#else 
packagemanager=$2
#fi


echo "This is the command passed $passedCommand"
echo  "This is the package manager $packagemanager"
echo  "This is the package $packages"


if [ "$passedCommand" == "configure-system"  ]
    then
    	cd  lib/configs/
       bash ./aliases.sh
       bash ./mkdir.sh
       bash ./badhosts.sh
       bash ./clean-up.sh
    cd ..
    pwd
    echo $passedCommand
elif [ "$passedCommand" == "set-ttl"  ]
    then
    echo "set-ttl reached"
    cd lib/scripts
    bash ./change-ttl.sh
    cd ..

elif [ "$passedCommand" == "install-apps"  ]
    then
 
    echo "Install apps"
    cd lib/utils/
    
    if [ "$packages" == "common" ]
    then
   	 bash ./installation-script.sh  "$packages" "$packagemanager"  
    else 
      echo "Test PKG $packages"
   	 bash ./installation-script.sh  $packagemanager
    fi
    cd ..


else 
    echo "No comannd passed"
    echo "./nova-script configure-system"
fi
