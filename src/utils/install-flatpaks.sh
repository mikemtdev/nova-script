#! /usr/bin/bash
# set -x
# Install form array  
# TODO: Change to cvs files




function install-flatpak () {

    #---- Local Variables ----
local flatpakapps=('com.visualstudio.code' 'io.atom.Atom' 'io.github.celluloid_player.Celluloid' 'flathub com.spotify.Client' 're.sonny.Tangram' 'nz.mega.MEGAsync' 'org.worldpossible.ScriptLauncher' 'com.bitwarden.desktop' 'com.belmoussaoui.Decoder')
    # This section contains all of the variables you want to use within your function. Be careful not to inadvertently name any of your variables the same as any existing environment variables, as bash scripts do not have function or block scope.
    # If you need scoping, consider using a subshell.

        # ← put your local variables here.

    #---- Function Logic ----
    # This section contains all of the commands you want to run.
        # ← put your commands here.

    for app in "${flatpakapps[@]}" 
    do
        echo "Installing Flatpak $app"
        sudo flatpak install -y "$app" || exit

    done
    #-------- Cleanup --------

    # This section contains all of the code you need to unset your local variables.

        # ← unset your local variables here.

}




install-flatpak ""