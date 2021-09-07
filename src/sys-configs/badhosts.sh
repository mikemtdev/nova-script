#! /usr/bin/bash
# author: mikemnjovu@gmail.com
set -x

# Run this Script as super user







function Pre-settup () {

    #---- Local Variables ----

    # This section contains all of the variables you want to use within your function. Be careful not to inadvertently name any of your variables the same as any existing environment variables, as bash scripts do not have function or block scope.
    # If you need scoping, consider using a subshell.

        # ← put your local variables here.

    #---- Function Logic ----

# Makeing copy of hosts file as a backup
echo "Baking up host file to /etc/host.bk"
sudo cp hosts hosts.bk
# sudo cp /etc/hosts /etc/hosts.bk
mkdir "tempfiles"
   

    #-------- Cleanup --------

    # This section contains all of the code you need to unset your local variables.

        # ← unset your local variables here.

}

function get-files () {

    #---- Local Variables ----
local GITREPO="https://github.com/Mikemnjovu/Badhostsfile.git"

    # This section contains all of the variables you want to use within your function. Be careful not to inadvertently name any of your variables the same as any existing environment variables, as bash scripts do not have function or block scope.
    # If you need scoping, consider using a subshell.

        # ← put your local variables here.

    #---- Function Logic ----

    # This section contains all of the commands you want to run.

( 
    cd tempfiles/ || exit
    git clone $GITREPO  # ← put your commands here.
    cd Badhostsfile || exit
    sudo -s cat -s Badhosts.txt >> /etc/hosts
    )


# Move out of the Badhosts folder to the root

    #-------- Cleanup --------

    # This section contains all of the code you need to unset your local variables.
 rm -rf tempfiles
        # ← unset your local variables here.

}
Pre-settup ""
get-files ""

# Pasting the contents of the badhosts.txt to the hosts on system
# sudo cat -S Badhosts.txt >> hosts

