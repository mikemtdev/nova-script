#! /usr/bin/bash
# author: mikemnjovu@gmail.com
# set -x 
# shellcheck source=../bash-utility/src/os.sh
source ../../lib/bash-utility/src/os.sh
PACKAGE=$1
PKGMANAGER=$2



echo "intallation script package ${PACKAGE} " # varible [assed into the script]
echo "Other package manager ${PKGMANAGER}"
THISOS=$(os::detect_linux_distro)

#Ubuntu
UBUNTUCOMMON=../../data/cvsFiles/Ubuntu-common.cvs
UBUNTUDEV=../../data/cvsFiles/Ubuntu-dev.cvs
UBUNTUDEVSETUP=../cvsFiles/Ubuntu-dev-setup.cvs

#Fedora 
FEDORACOMMON=../../data/cvsFiles/Fedora-CentOS-common.cvs
FEDORADEV=../../data/cvsFiles/Fedora-CentOS-dev.cvs
FEDORADEVSETUP=../../data/cvsFiles/Fedora-CentOS-setup.cvs

OLDIFS=$IFS
IFS=','
function installAptFast(){
    echo "$1" "$2" 
 sudo "$1" install "$2" -y
 sudo "$1" --fix-broken install -y
}

function installFromCvs(){
	
   local passedpkgmanager=$1
    local INPUTFILE=$2 
    echo " passedpkgmanager passed $passedpkgmanager"
       echo " Inpufile passed $INPUTFILE"
         [ ! -f "$INPUTFILE" ] && { echo "$INPUTFILE file not found"; exit 99; }
    while read -r software install  
    do
        if [ "$install" == "yes" ] 
            then
           
            installAptFast "$passedpkgmanager" "$software" 
            
        else 
            echo "Not installing  : $software"
        fi
    done < <( tail -n +2  "$INPUTFILE") # Skiipping two columns ( in this case the header)
    IFS=$OLDIFS 
}

function curlInstall(){
    $1 
    $2 
    $3
}
function installPowerlevel10K(){
 sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM"/themes/powerlevel10k
}

#Installation and setup of FZF (Fuzzy Search)

function installFZF(){
sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sudo ~/.fzf/install --all 
}
#Installation and setup of Z (Smart Directory Jump)

function installZ(){
sudo git clone https://github.com/agkozak/zsh-z "$ZSH_CUSTOM"/plugins/zsh-z
sudo echo 'plugins=( git zsh-z )' | sudo tee -a ~/.zshrcle > /dev/null
}

function installZsh(){
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}
function installNpmGlobalPackages(){
    sudo npm i "$1" -g
}

function yarnInstall {
    sudo yarn "$1" add "$2"
}
function intallGlobalPkgsYarn {
    yarnInstall "global" "create-react-app"
}
function installNvmAndSetup(){
    curlInstall "curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh" "bash install_nvm.sh " 
    nvm install --lts
    sudo rm -rf install_nvm.sh

}

function configureInstall(){
    
    # installNvmAndSetup
    #Setup yarn
    installNpmGlobalPackages "yarn"
    installNpmGlobalPackages "nodemon"
    intallGlobalPkgsYarn 

    #Terminal 
    # installZsh 
    # installFZF 
    # installZ

    # configure
    # chsh -s $(which zsh)

}

function installFunCall(){
       local PASSEDPKGMANAGER=$1
       local PASSEDPAKAGE=$2
       local OSPKGFILE=$3
       local Ubuntufile1=$UBUNTUCOMMON
        local Ubuntufile2=$UBUNTUDEV
       local Ubuntufile3=$UBUNTUDEVSETUP
       
        echo " PASSEDPKGMANAGER $PASSEDPKGMANAGER"
           echo " PASSEDPAKAGE $PASSEDPAKAGE"
           
        # echo "file3 $Ubuntufile3"
        
        function installbasedonpkg(){
        local pkgmanager=$1
        local pkg=$2
        	if [ "$PASSEDPAKAGE" == 'common'  ]
		then 
		installFromCvs "$pkgmanager" "$pkg"
		    elif [ "$PASSEDPAKAGE" == 'dev'  ]
			then
			installFromCvs "$pkgmanager" "$pkg"
		    elif [ "$PASSEDPAKAGE" == 'dev-setup' ]
			then
			installFromCvs "$pkgmanager" "$pkg"
			configureInstall 
	    	fi
        }
        
        if [ "$PASSEDPKGMANAGER" == "dnf" ]
        then	
  		installbasedonpkg "$PASSEDPKGMANAGER" "$FEDORACOMMON" 
        elif [ $"$PASSEDPKGMANAGER" == "apt" ]
        then
        	echo "ab"
        
        elif [ "$PASSEDPKGMANAGER" == "apt-fast" ]
        then
    		echo "a"
        fi
  
           
}


if [ "$2" = "apt-fast" ]
then 
	installFunCall "apt-fast"  "$PACKAGE"
else
	if [[ "$THISOS" = "fedora" || "cent-os" ]] 
	then 
		#echo "$THISOS"
		#echo "Using dnf as PKG"
		#echo "this is the pakage passed here! $PACKAGE"
		installFunCall "dnf"  "$PACKAGE"
		
		
	elif [[ "$THISOS" = "ubuntu" || "debian" || "linux-mint" ]]
	then 
		echo "$THISOS"
		echo "Using apt as PKG"
		installFunCall "apt" "$PACKAGE"
	elif [ "$THISOS" = "mac-os" ]
	then
		echo "$THISOS"
		installFunCall "brew" "$PACKAGE"
	else
		echo "Not configured for this"
		echo "noting happening $2"
	fi

fi





    
