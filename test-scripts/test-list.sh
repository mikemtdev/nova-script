#!/bin/bash
# Purpose: Read Comma Separated CSV File
# Author: Vivek Gite under GPL v2.0+
# ------------------------------------------
UBUNTUINPUT=Ubuntu-common.cvs
OLDIFS=$IFS
IFS=','

DISTRIBUTION=uname  | grep Ubuntu
if [ "$DISTRIBUTION" == "Ubuntu" ]
	then 
		echo "$DISTRIBUTION"
else 
	echo "Not know disribution"
fi

# [ ! -f $UBUNTUINPUT ] && { echo "$UBUNTUINPUT file not found"; exit 99; }
# while read  software install  
# do
# 	if [ "$install" == "yes" ] 
# 		then
# 		echo "Installing $software"
# 		echo "Status $install"
# 	else 
# 		echo "Not installing  : $software"
# 	fi
# done < <( tail -n +2  $UBUNTUINPUT) # Skiipping two columns ( in this case the header)
# IFS=$OLDIFS