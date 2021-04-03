#! /usr/bin/bash


function installFun(){
    sudo dnf install $1 -y
    $2
}

function curlInstall(){
    curl  $1
    # sudo rpm -i $2
}
function addRepositories(){
    sudo $1
    
}
function ugetIntegratorInstall(){
    wget https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh
    chmod +x install_uget_integrator.sh
    ./install_uget_integrator.sh
    
}


# addRepositories "dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" "dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"


# Installation Code
#update
sudo dnf update -y

# Software
installFun "curl"
installFun "vlc"
installFun "gnome-tweaks"
installFun "transsmition"
installFun "uget" "ugetIntegratorInstall" 
installFun "codec2"

# Clean up
sudo rm -f install_uget_integrator.sh


# curlInstall "https://github-production-release-asset-2e65be.s3.amazonaws.com/76930145/c0831f00-26ca-11eb-8bcd-b2cc7b9c554e?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20201124%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20201124T125339Z&X-Amz-Expires=300&X-Amz-Signature=094258e6b08e48f6bbe0ff8eded3af2be1840021833bca84f93efff3359e995d&X-Amz-SignedHeaders=host&actor_id=45319708&key_id=0&repo_id=76930145&response-content-disposition=attachment%3B%20filename%3DBitwarden-1.23.0-x86_64.rpm&response-content-type=application%2Foctet-stream"
# curlInstall "https://az764295.vo.msecnd.net/stable/e5a624b788d92b8d34d1392e4c4d9789406efe8f/code-1.51.1-1605051791.el7.x86_64.rpm"