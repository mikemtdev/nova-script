#!/bin/bash 

FLATPAKCSV=../cvsFiles/flatpaks.cvs



function installFromCvs(){

	
   local passedpkgmanager="flatpak"
    # local INPUTFILE='../../data/cvsFiles/flatpaks.cvs'
    local INPUTFILE=( "com.visualstudio.code" "io.atom.Atom" "io.github.celluloid_player.Celluloid" "flathub com.spotify.Client" "re.sonny.Tangram" "nz.mega.MEGAsync" "org.worldpossible.ScriptLauncher" "com.bitwarden.desktop" "com.belmoussaoui.Decoder" )
     
    
    echo " passedpkgmanager passed $passedpkgmanager"
       echo " Inpufile passed $INPUTFILE"
       
       
       
      function installFlatpak(){
      local $1
   echo "$1"
   sudo flatpak install -y --noninteractive flathub  "$1" 
      	
      }
    #     [ ! -f "$INPUTFILE" ] && { echo "$INPUTFILE file not found"; exit 99; }
    # while read -rp software install  
    # do
    #     # if [ "$install" == "yes" ] 
    #     #    then
           
    #         installFlatpak "$passedpkgmanager" "$software" 
            
    #     # else 
    #     #    echo "Not installing  : $software"
    #     # fi
    # done < <( tail -n +2  "$INPUTFILE") # Skiipping two columns ( in this case the header)
    # IFS=$OLDIFS 
for file in "$INPUTFILE"
do 
	installFlatpak "$passedpkgmanager" "$file" 
done

}

installFromCvs "$FLATPAKCSV"
