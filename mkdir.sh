#! /usr/bin/bash



# Variables  

PROJECTFOLDER="Project"
FOLDERNAMES=("Programming" "Video" "Music" "Animation")
FOLDERNAMESPROGRAMMING=("Web" "Node" "Clone" "JS" "React_Native" "Bash")


# Code to be executed

cd  
mkdir $PROJECTFOLDER
mkdir tempfiles
cd $PROJECTFOLDER
for FOLDER in ${FOLDERNAMES[@]}
    do 
        mkdir $FOLDER
        echo "created Folders"
        ls
done

cd ${FOLDERNAMES[0]}
for FOLDER in ${FOLDERNAMESPROGRAMMING[@]}
    do 
        mkdir $FOLDER
        echo "created Folders"
        ls
done
