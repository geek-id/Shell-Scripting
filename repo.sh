#!/bin/bash

# Adding new indonesian repository (local repository)

echo -e "#########################################################"
echo -e "##\t\t\t\t\t\t\t##"
echo -e "##\t       Auto Add Repository Indonesia\t        ##"
echo -e "##  This tools for auto add repository local Indonesia  ##"
echo -e "##\t\t\tv.0.0.1 (beta)\t\t\t##"
echo -e "##\t\t\t\t\t\t\t##"
echo -e "##########################################################"

source=`pwd`/sources.list
sourcedest="$source".bak

add_kambing(){
  if grep -q 'id.ubuntu.com' $source; then
     echo -e "The repo was listed in file sources.list"
  else
     cat $source
  fi
}

ubuntu_kambing(){
   if [ -e $source ];then
      echo -e "The files was backup"
      add_kambing
   else
      cp $source $sourcedest
   fi
   echo -e "This is repo of kambing.ui.ac.id";

}

ubuntu_itb(){
   echo -e "This is repo of itb";
}

ubuntu_kartolo(){
   echo -e "This is repo of kartolo";
}

ubuntu_ubaya(){
   echo -e "This is repo of ubaya";
}

ubuntu_all(){
   echo -e "This is repo of all";
}

if [ "$(id -u)" != "0" ]; then
    echo "Please run as root."
else
    echo "Do you want add new repository?"
    echo "Avalaible Repository now :"
    echo -e "1) Kambing UI\t\t4) Ubaya"
    echo -e "2) ITB\t\t\t5) All Repo"
    echo -e "3) Kartolo"
    echo -n "Select your repository for adding: "
    read repo
    #echo -e "$repo"

case "$repo" in
   1)
     echo -e "You're now add repository from kambing.ui.ac.id";
     ubuntu_kambing
     ;;
   2)
     echo -e "You're now add repository from ITB"
     ubuntu_itb
     ;;
   3)
     echo -e "You're now add repository from Kartolo"
     ubuntu_kartolo
     ;;
   4)
     echo -e "You're now add reposiroty from Ubaya"
     ubuntu_ubaya
     ;;
   5)
     echo -e "You're now add All Repository"
     ubuntu_all
     ;;
   *)
     echo -e "Select the correct choice."
     ;;
esac
    echo -e "Done..."
fi
