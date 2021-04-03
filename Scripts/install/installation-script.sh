#! /usr/bin/bash
# author: mikemnjovu@gmail.com


echo "intallation script "$1 $2  # varible [assed into the script]
UBUNTUCOMMON=cvsFiles/Ubuntu-common.cvs
UBUNTUDEV=cvsFiles/Ubuntu-dev.cvs
UBUNTUDEVSETUP=cvsFiles/Ubuntu-dev-setup.cvs
OLDIFS=$IFS
IFS=','
function installAptFast(){
    echo "$1" "$2" 
 sudo apt-fast install $2
}

function installFromCvs(){
    INPUTFILE=$1 
         [ ! -f $INPUTFILE ] && { echo "$INPUTFILE file not found"; exit 99; }
    while read  software install  
    do
        if [ "$install" == "yes" ] 
            then
            installAptFast "$1" "$software"
            # sudo $1 --fix-broken install -y
        else 
            echo "Not installing  : $software"
        fi
    done < <( tail -n +2  $INPUTFILE) # Skiipping two columns ( in this case the header)
    IFS=$OLDIFS 
}

function curlInstall(){
    $1 
    $2 
    $3
}

function installZsh(){
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
function installNvmAndSetup(){
    curlInstall "curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh" "bash install_nvm.sh" 
    exec $SHELL
    nvm install --lts
}

function configureInstall(){
    
    installNvmAndSetup
    #Setup yarn
    installYarn 
    intallGlobalPkgsYarn 

    #Terminal 
    installZsh 
    installFZF 
    installZ
}

function installFunCall(){
        command=$1 
        Ubuntufile1=$UBUNTUCOMMON
        Ubuntufile2=$UBUNTUDEV
        Ubuntufile3=$UBUNTUDEVSETUP
        #   echo " command $1"
        # echo "file3 $Ubuntufile3"
    if [ "$command" == 'common'  ]
        then 
        installFromCvs "$Ubuntufile1"
    elif [ "$command" == 'dev'  ]
        then
        installFromCvs "$Ubuntufile2"
    elif [ "$command" == 'dev-setup' ]
        then
        installFromCvs "$Ubuntufile3"
        configureInstall 
    fi
           
}



if [ "$1" == "apt-fast" ]
    then 
    installFunCall "$2"  "$UBUNTUDEV "

elif  [ "$1" == "dnf" ] 
    then 
    installFunCall "$2"
elif  [ "$1" == "apt" ] 
        then 
        installFunCall "$2"
else 
    echo "noting happening $2"
fi

    