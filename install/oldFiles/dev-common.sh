#! /usr/bin/bash

function installFun(){
    sudo dnf install $1 -y
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
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
sudo echo 'plugins=( git zsh-z )' >> ~/.zshrc
}

sudo dnf update -y

# Installation Code
installFun "fira-code-fonts"
installFun "git"
installFun "util-linux-user"

# Terminal (shell) 
installZsh 
installFZF 
installZ

# Setting up Powerlevel10K
p10k configure