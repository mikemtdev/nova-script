#! /usr/bin/bash

# Utility functions
function installFun(){
    sudo apt install $1 -y
}


function curlInstall(){
    $1 
    $2 
    $3
}
function installZsh(){
    installFun "zsh"
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

}
# Installation and setup of Powerlevel10K
function installPowerlevel10K(){
 sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
}

#Installation and setup of FZF (Fuzzy Search)

function installFZF(){
sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sudo ~/.fzf/install 
}
#Installation and setup of Z (Smart Directory Jump)

function installZ(){
sudo git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
sudo echo 'plugins=( git zsh-z )' >> ~/.zshrc
}
function installYarn(){
    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
    installFun "yarn"
}

function yarnInstall {
    sudo yarn $1 add $2
}
function intallGlobalPkgsYarn {
    yarnInstall "global" "create-react-app"
}


# Executing Code

# Updating repositories
sudo apt update -y

installFun "fonts-firacode"
installFun "git"
installFun "util-linux-user"
installFun "nodejs" 
curlInstall "curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh" "bash install_nvm.sh" 
exec $SHELL
nvm install --lts
installYarn ""
intallGlobalPkgsYarn 


# # Terminal (shell) 
installZsh 
installFZF 
installZ

# Setting up Powerlevel10K
# p10k configure