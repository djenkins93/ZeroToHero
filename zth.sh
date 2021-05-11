#!/bin/bash
# 
# Description: Add cyber-security capabilities to chromeOS automatically installing
# --a selection of current ChromeOS compatible tools based on the "ChromeBrew" list
#
# Usage:./zth.sh  
#


#0.COLLECT THE USER SELECTION  
usr_input() 
{ 
    read -p "Press [Enter] to continue..." fackEnterkey 
    echo " -------------------------------------------------"
}

#1.CHECK REQUIRED TOOLS 
syschk()
{ 
   2>/dev/null 1>/dev/null  whereis crew& #check for required Chrome Brew Package Manager 
                 #if not installed-inform user as if they want to continue 
    if [ $? -eq 0 ] 
    then 
        #start installation(s)
        echo "Required system package check: Passed" 
        echo "Starting installation..."
    else
       #Chromebrew pacakge manager not installed 
       echo "-------------------------------------------------------------------------"
       echo "Required system package check: Failed."
       echo "Chromebrew package manager missing! This is required to run Zero-To-Hero."
       echo "-------------------------------------------------------------------------"
       echo "Would you like to install and continue? (y/n)" 
       read syschk_choice  
        
                if [ "$syschk_choice" == "y" ] || [ "$syschk_choice" == "Y"] 
                then 
                        # retrieve and install the chromebrew pkg 
                        curl -Ls git.io/vddgY | bash
        
                elif [ "$syschk_choice" == "n" ] || [ "$syschk_choice" == "N" ]
                then     
                     echo "Exiting..."
                     exit 0
                fi 
     fi 
}

#2. BEGIN TOOL INSTALLATION
installer()
{ 
        # CORE MTHD THAT HANDLES PKG(S) INSTALLATION 
        while read line 
        do 
                # begin pkg installation 
                # use the chromebrew repositories 
                # find out if it automatically  pulls from the source 
                crew install $line&
                #break

                if ! [ $? -eq 0 ] 
                then 
                        # if this doesn't work then 
                        2>/dev/null 1>/dev/null 
                        echo "INSTALLATION ATTEMPTS from both the repository and source FAILED." 
                fi


        done < zth_default_pkgs.txt 

}

# 1.DEFAULT INSTALL
default_install()
{ 
    #begin installtion of deault tool/app listing
    echo "Beginning default installation..." 
    syschk
    installer
    
} 

#2.VIEW PKGS
view_opts()
{ 
        #Show current available network tools and options 
        echo "print list of available packages."

}

#3.HELP
more_info()
{ 
    #cat
    echo "usage: ./zth" 
}

#4.QUIT
quit()
{ 
    echo "Farewell _br4ve-trave1er." 
    exit 0
}

# main_mnu function 
read_select() 
{ 
    local select 
    echo "---------------------------"
    read -p "Enter Selection: " select 
    echo " "
    case $select in 
        1) default_install ;;
        2) view_opts    ;; 
        3) more_info    ;;
        4) quit ;;
        *) echo "ERROR. Exiting." ;;  
    esac 
 } 
 
start_menu()
{ 
    clear
    echo -e "\e[97m 
ooooooooooo                           ooooooo        
88    888    ooooooooo8 oo oooooo   o888  o888o      
    888     888oooooo8   888    888 888  8  888      
  888    oo 888          888        888o8  o888      
o888oooo888   88oooo888 o888o         88ooo88        
                                                     
             o8                                                    
           o888oo ooooooo                                       
            888 888     888                                     
            888 888     888                                     
             888o 88ooo88                                       
                                                     
ooooo ooooo                                          
 888   888  ooooooooo8 oo oooooo     ooooooo         
 888ooo888 888oooooo8   888    888 888     888       
 888   888 888          888        888     888       
o888o o888o  88oooo888 o888o         88ooo88   V.1.0      
                                                                            
             
  ====================================================          
  Author: _XXX_ | SUMMER 2021
    " 

        
  echo "  1.) Install Default Loadout " 
  echo "  2.) View Categories & Available Packages "
  echo "  3.) Help " 
  echo "  4.) Quit " 
}
 


 start_menu #get the menu going 
 read_select #read the user supplied input 