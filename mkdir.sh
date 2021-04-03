#! /usr/bin/bash

# Make Directories
# RootDir ='~/ '
# echo 'name ' whoami
# RootDir = "/home/Mikey"
# if [RootDir]
# then 
#     echo "exists"
# else 
#     read -p "Enter your username": USERNAME
#     echo USERNAME
# fi

PROJECTFOLDER=("Projects" "Build" "Scripts")
FOLDERNAMES=("Programming" "Video" "Music" "Animation")
FOLDERNAMESPROGRAMMING=("Web" "Node" "Clone" "JS" "React_Native" "Bash")


cd  /home/mikey/
for FOLDER in ${PROJECTFOLDER[@]}
    do 
        mkdir $FOLDER
        echo "created Folders"
        ls
done
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
