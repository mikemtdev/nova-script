#! /usr/bin/bash
# author: mikemnjovu@gmail.com

# set -x
touch ~/.bash_aliases

AliasesFilePath='../../data/aliases.txt'
GitAliasesFilePath='../../data/git_aliases.txt'

# Bash Aliases setup
echo "if [ -e $HOME/.bash_aliases ]; 
    then
     source $HOME/.bash_aliases 
    fi"  >> ~/.bash_aliases
cat $AliasesFilePath >> ~/.bash_aliases

# Git Aliaes Setup
if [ -e $HOME/.bash_aliases ]; 
    then
cat $GitAliasesFilePath >> ~/.gitconfig
    else 
        touch ~/.gitconfig
fi