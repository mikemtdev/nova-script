#! /usr/bin/bash
set -x
touch ~/.bash_aliases

#Bash Aliases setup
echo "if [ -e $HOME/.bash_aliases ]; 
    then
     source $HOME/.bash_aliases 
    fi" >> ~/.bash_aliases

echo "
alias c='clear'
#Sorting by file size
alias lt='ls --human-readable --size -1 -S --classify'
#mnt show mounted divices
alias mnt='mount | grep -E ^/dev | column -t'
#cpv Copy with progress bar 
alias cpv='rsync -ah --info=progress2'
# Moving files to trash instead of using rm.
alias tcn='mv --force -t ~/.local/share/Trash '
# Open Vs code  in currnet dir
alias vsc.='code .'

# Add safety nets

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Get system memory, cpu usage, and gpu memory info quickly
## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Grep Commad
## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# handy short cuts #
alias h='history'
alias j='jobs -l'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

## Security 
## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist


## NetWorking 

#quickly list all TCP/UDP port on the server
alias ports='netstat -tulanp'
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# Debug web server / cdn problems with curl
# get web server headers #
alias header='curl -I'
 
 # become root #
alias root='sudo -i'
alias su='sudo -i'


# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'


#Resume wget
##27 Resume wget by default#27 Resume wget by default

## this one saved by butt so many times ##
alias wget='wget -c'


# Dir 

#Makes dir and prints it if made  No errors if exists.
alias mkdir='mkdir -pv'
# to root folder
#going to root folder
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


#cd to Project/Proramming 
alias cdpp='cd Projects/Programming/'
">> ~/.bash_aliases

set +x