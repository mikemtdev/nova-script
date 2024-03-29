#! /usr/bin/bash
# author: mikemnjovu@gmail.com


passedCommand=$1
packageInstaller=$2
packages=$3
echo $passedCommand
echo $packageInstaller  $packages

if [ "$passedCommand" == "configure-system"  ]
    then
    cd  Scripts/
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
    cd Scripts/
    bash ./change-ttl.sh
    cd ..

elif [ "$passedCommand" == "install-apps"  ]
    then
    cd Scripts/install/
    bash ./installation-script.sh $packageInstaller $packages
    cd ..


else 
    echo "No comannd passed"
    echo "./nova-script configure-system"
fi