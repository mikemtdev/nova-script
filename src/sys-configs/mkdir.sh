#! /usr/bin/bash
# Author: Mikemnjovu@gmail.com


# Variables  
HOMEFOLDERS=("Projects" "Builds" "Pakages" "Scripts")
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
#   NONEXISTANT='does not exist'  
#   EXIST='exist'

#   <--- Functions -->
function rootDir() {
    cd || exit
}
# Creating Folder Func
function makeFolder(){
    mkdir "$FOLDER"
    printf "created Folders"
    ls
}

# Downloads
function creatDownloadsSubFolders() {
    DOWNLOADFOLDER="Downloads"
   function createFolderFunc() {
        for FOLDER in "${DOWNLOADSSUBFOLDERS[@]}"
        do 
            makeFolder "${FOLDER}"
        done
   }
   (if [ -d $DOWNLOADFOLDER ]
   then
        cd $DOWNLOADFOLDER || exit
        createFolderFunc ""
    else 
     rootDir "" # ---> Production code
         mkdir "$DOWNLOADFOLDER "
       if [ -d $DOWNLOADFOLDER ]  
           then
          cd $DOWNLOADFOLDER || exit
             createFolderFunc "" 
        else
            makeFolder $DOWNLOADFOLDER
            cd $DOWNLOADFOLDER || exit
            createFolderFunc "" 
       
       fi
    fi
    cd .. || exit # exit folder
    )
    pwd
}
# Javascript Freamwork
function creatWebSubFolders() {
    WEB="Web"
   function createFolderFunc() {
        for FOLDER in "${JAVASCRIPTFREAMWORKS[@]}"
        do 
            makeFolder "${FOLDER}"
        done
   }
   (if [ -d $WEB ]
   then
        cd $WEB || exit
        createFolderFunc ""
    else 
     rootDir "" # ---> Production code
     cd Projects/Programming || exit
         mkdir $WEB 
       if [ -d $WEB ]  
           then
          cd $WEB || exit
             createFolderFunc "" 
        else
            makeFolder $WEB
            cd $WEB || exit
            createFolderFunc "" 
       
       fi
    fi
    )
    pwd
}

# Movies --> this is being called in the Videos 
function creatMoviesSubFolders() {
    MOVIESDIR="Movies"
   function createFolderFunc() {
        for FOLDER in "${MOVIES[@]}"
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $MOVIESDIR ]
   then
        cd $MOVIESDIR || exit
        createFolderFunc ""
    else 
     rootDir "" # ---> Production code
        cd Videos/ || exit # ---> Production code
         mkdir $MOVIESDIR
       if [ -d $MOVIESDIR ]  
           then
          cd $MOVIESDIR || exit
             createFolderFunc "" 
        else
            makeFolder $MOVIESDIR
            cd $MOVIESDIR || exit
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
        for FOLDER in "${VIDEOS[@]}"
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $VIDEOSDIR ]
   then
        cd $VIDEOSDIR || exit
        createFolderFunc ""
    else 
          rootDir "" # ---> Production code
         mkdir $VIDEOSDIR
       if [ -d $VIDEOSDIR ]  
           then
          cd $VIDEOSDIR || exit
             createFolderFunc "" 
        else
            makeFolder $VIDEOSDIR
            cd $VIDEOSDIR || exit
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
        for FOLDER in "${PICTURES[@]}"
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d $PICTURESDIR ]
   then
        cd $PICTURESDIR || exit
        createFolderFunc ""
    else 
        rootDir "" # ---> Production code
         mkdir $PICTURESDIR
       if [ -d $PICTURESDIR ]  
           then
          cd $PICTURESDIR || exit
             createFolderFunc "" 
        else
            makeFolder $PICTURESDIR
            cd $PICTURESDIR || exit
            createFolderFunc "" 
       
       fi
    fi

    
    cd .. # exit folder
    pwd
}

function createHomeFolders() {
   
    # This creates folders on the home Directiory
    for FOLDER in "${HOMEFOLDERS[@]}" 
    do 
    makeFolder "$FOLDER"
    done 

  
}

 function creatProjectSubFolders() {
# This creates folders on the home Directiory
    #---- Local Variables ----

    #---- Function Logic ----
    cd $PROJECTFOLDER || exit
        for FOLDER in "${PROJECTSSUBFOLDERS[@]}"
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
         for FOLDER in "${PROGRAMMINGSUBFOLDERS[@]}"
            do 
                makeFolder "${FOLDER}"
        done
    } 
    if [ -d Programming ] 
    then
        cd Programming || exit
        createFuncProgramming ""
       
    else
        cd Project/Programming || exit
        createFuncProgramming ""
        pwd
    fi


}
function creatGraphicSubFolders() {
   function createFolderFuncGraphics() {
        for FOLDER in "${GRAPHICSSUBFOLDERS[@]}"
        do 
            makeFolder "${FOLDER}"
        done
   }
   if [ -d Graphics ]
   then
        cd Graphics || exit
        createFolderFuncGraphics ""
    else 
        cd  /Projects/Graphics/ || exit
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


