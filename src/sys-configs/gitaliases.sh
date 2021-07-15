
#! /usr/bin/bash
# author: mikemnjovu@gmail.com

# set -x
# touch bash_aliases
AliasesFilePath='../../data/git_aliases.txt'

# Bash Aliases setup
echo "if [ -e $HOME/.gitconfig ]; 
    then
     source $HOME/.gitconfig 
    fi"  > ~/.gitconfig
cat $AliasesFilePath > ~/.gitconfig

