#! /usr/bin/bash

# Author: Mikemnjovu@gmail.com


# Variables  
HOMEFOLDERS=("Projects" "Builds" "Pakages" )
DOWNLOADSSUBFOLDERS=("Docs" "Pics" "Audio" "Videos" "Torrents" "Programs" "Temporary" "Other" "Compressed")  
VIDEOS=("Tutorials" "Movies" "Music" "Clips" "Other")
MOVIES=("Series" "Cartoons")
JAVASCRIPTFREAMWORKS=("Reactjs" "Metteor" "NextJs" "Gatsby" "Vanilla" "Learn")
PICTURES=("SecreenShots" "Personal" "Others" "Inspiration")
PROJECTFOLDER="Projects"
PROJECTSSUBFOLDERS=("Programming" "Video" "Music" "Animation" "Graphics")
GRAPHICSSUBFOLDERS=("Ux_Ui" "Branding")
PROGRAMMINGSUBFOLDERS=("Web" "Node" "Clone" "JS" "React_Native" "Bash")

# Erro Massage 
  NONEXISTANT='does not exist'  
  EXIST='exist'

#   <--- Functions -->
function rootDir() {
    cd 
}
# Creating Folder Func
function makeFolder(){
    mkdir $FOLDER
    printf "created Folders"
    ls
}

# Downloads
function creatDownloadsSubFolders() {
    DOWNLOADFOLDER="Downloads"
   function createFolderFunc() {
        for FOLDER in ${DOWNLOADSSUBFOLDERS[@]}
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $DOWNLOADFOLDER ]
   then
        cd $DOWNLOADFOLDER
        createFolderFunc ""
    else 
     rootDir "" # ---> Production code
         mkdir $DOWNLOADFOLDER 
       if [ -d $DOWNLOADFOLDER ]  
           then
          cd $DOWNLOADFOLDER
             createFolderFunc "" 
        else
            makeFolder $DOWNLOADFOLDER
            cd $DOWNLOADFOLDER
            createFolderFunc "" 
       
       fi
    fi
    cd .. # exit folder
    pwd
}
# Javascript Freamwork
function creatWebSubFolders() {
    WEB="Web"
   function createFolderFunc() {
        for FOLDER in ${JAVASCRIPTFREAMWORKS[@]}
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $WEB ]
   then
        cd $WEB
        createFolderFunc ""
    else 
     rootDir "" # ---> Production code
     cd Projects/Programming
         mkdir $WEB 
       if [ -d $WEB ]  
           then
          cd $WEB
             createFolderFunc "" 
        else
            makeFolder $WEB
            cd $WEB
            createFolderFunc "" 
       
       fi
    fi
    cd .. # exit folder
    pwd
}

# Movies --> this is being called in the Videos 
function creatMoviesSubFolders() {
    MOVIESDIR="Movies"
   function createFolderFunc() {
        for FOLDER in ${MOVIES[@]}
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $MOVIESDIR ]
   then
        cd $MOVIESDIR
        createFolderFunc ""
    else 
     rootDir "" # ---> Production code
        cd Videos/ # ---> Production code
         mkdir $MOVIESDIR
       if [ -d $MOVIESDIR ]  
           then
          cd $MOVIESDIR
             createFolderFunc "" 
        else
            makeFolder $MOVIESDIR
            cd $MOVIESDIR
            createFolderFunc "" 
       
       fi
    fi
    cd .. # exit folder
    pwd
}

# Videos
function creatVideosSubFolders() {
    VIDEOSDIR="Videos"
   function createFolderFunc() {
        for FOLDER in ${VIDEOS[@]}
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $VIDEOSDIR ]
   then
        cd $VIDEOSDIR
        createFolderFunc ""
    else 
          rootDir "" # ---> Production code
         mkdir $VIDEOSDIR
       if [ -d $VIDEOSDIR ]  
           then
          cd $VIDEOSDIR
             createFolderFunc "" 
        else
            makeFolder $VIDEOSDIR
            cd $VIDEOSDIR
            createFolderFunc "" 
       
       fi
    fi

    creatMoviesSubFolders "" # --> Creating SubFolders
    
    cd .. # exit folder
    pwd
}
# Pictures
function creatPicturesSubFolders() {
    PICTURESDIR="Pictures"
   function createFolderFunc() {
        for FOLDER in ${PICTURES[@]}
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $PICTURESDIR ]
   then
        cd $PICTURESDIR
        createFolderFunc ""
    else 
        rootDir "" # ---> Production code
         mkdir $PICTURESDIR
       if [ -d $PICTURESDIR ]  
           then
          cd $PICTURESDIR
             createFolderFunc "" 
        else
            makeFolder $PICTURESDIR
            cd $PICTURESDIR
            createFolderFunc "" 
       
       fi
    fi

    
    cd .. # exit folder
    pwd
}

function createHomeFolders() {
   
    # This creates folders on the home Directiory
    for FOLDER in ${HOMEFOLDERS[@]} 
    do 
    makeFolder $FOLDER
    done 

  
}

 function creatProjectSubFolders() {
# This creates folders on the home Directiory
    #---- Local Variables ----

    #---- Function Logic ----
    cd $PROJECTFOLDER
        for FOLDER in ${PROJECTSSUBFOLDERS[@]}
            do 
            makeFolder "${FOLDER}"
        done
        
        
    createProgrammingSubFolders "" # --> Creates Subfolder in Programming
    pwd
    cd ..
    creatGraphicSubFolders "" # --> Creates Subfolder in Graphics
    pwd


}
function createProgrammingSubFolders(){
    createFuncProgramming() {
         for FOLDER in ${PROGRAMMINGSUBFOLDERS[@]}
            do 
                makeFolder "${FOLDER}"
        done
    } 
    if [ -d Programming ] 
    then
        cd Programming
        createFuncProgramming ""
       
    else
        cd Project/Programming
        createFuncProgramming ""
        pwd
    fi


}
function creatGraphicSubFolders() {
   function createFolderFuncGraphics() {
        for FOLDER in ${GRAPHICSSUBFOLDERS[@]}
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d Graphics ]
   then
        cd Graphics
        createFolderFuncGraphics ""
    else 
        cd  /Projects/Graphics/
        createFolderFuncGraphics ""   
    fi
}

# Code to be executed

# <==+++++++++++++++++++====>

# <--- Test Folders --->


#   mkdir Test_Home
# cd Test_Home



# <===============================>
# <--- Production --->


rootDir "" 
createHomeFolders "" # -> Creating Folders at root Dir
creatDownloadsSubFolders "" # --> Creating sub Download folders
creatVideosSubFolders "" # --> Creating sub Videos folders
creatPicturesSubFolders "" # --> Creating sub Pictures folders
creatProjectSubFolders "" # --> Creating sub Pictures folders
creatWebSubFolders ""
rootDir ""
pwd


