#!/bin/bash 

FLATPAKCSV=../cvsFiles/flatpaks.cvs



function installFromCvs(){

	
   local passedpkgmanager="flatpak"
    local INPUTFILE=( "com.visualstudio.code" "io.atom.Atom" "io.github.celluloid_player.Celluloid" "flathub com.spotify.Client" "re.sonny.Tangram" "nz.mega.MEGAsync" "org.worldpossible.ScriptLauncher" "com.bitwarden.desktop" "com.belmoussaoui.Decoder" )
    
    
    echo " passedpkgmanager passed $passedpkgmanager"
       echo " Inpufile passed $INPUTFILE"
       
       
       
      function installAptFast(){
      local $1
      $
   flatpak install flathub $1 
      	
      }
     #    [ ! -f $INPUTFILE ] && { echo "$INPUTFILE file not found"; exit 99; }
    #while read  software install  
    #do
        #if [ "$install" == "yes" ] 
        #    then
           
            installAptFast "$passedpkgmanager" "$software" 
            
        #else 
         #   echo "Not installing  : $software"
        #fi
    #done < <( tail -n +2  $INPUTFILE) # Skiipping two columns ( in this case the header)
    #IFS=$OLDIFS 
for file in $INPUTFILE
do 
	installAptFast "$passedpkgmanager" "$file" 
done

}

installFromCvs "$FLATPAKCSV"
