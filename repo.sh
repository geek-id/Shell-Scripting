#!/bin/bash

# repo.sh is tools for auto adding repository. This tools will work on
# Debian, Ubuntu and will develop to repo CentOS.
# This tools licensed under GNU Public License (GPLv2)
# copyright github.com/geek-id


ubuntu(){
   OS=$(lsb_release -si)
   vers=$(lsb_release -sr)
   codename=$(lsb_release -sc)
   
   if [ $OS == 'Ubuntu' ] && [ $vers == '14.04' ] ;then
       return 0;
   elif [ $OS == 'Ubuntu' ] && [ $vers == '15.04' ] ; then
       return 0;
   elif [ $OS == 'Ubuntu' ] && [ $vers == '16.04' ] ; then
       return 0;
   else
      echo "Linux: $(lsb_release -si)"
      echo "Version: $(lsb_release -sr)"
   fi
}

ubuntu_trusty(){
  if [ $OS == 'Ubuntu' ] && [ $vers == '14.04' ] ;then
    echo -e "Do you want add repository" $OS $codename "?"
    echo -e "Select your favorit repository: "
    echo -e "1. kambing.ui.ac.id"
    echo -e "2. itb.ac.id"
    echo -e "3. All Repository"

    echo -n "Your choice: "
    read trusty
  fi
}

ubuntu_vivid(){
  if [ $OS == 'Ubuntu' ] && [ $vers == '15.04' ] ;then
    echo -e "Do you want add repository" $OS $codename "?"
    echo -e "Select your favorit repository: "
    echo -e "1. kambing.ui.ac.id"
    echo -e "2. itb.ac.id"
    echo -e "3. All Repository"

    echo -n "Your choice: "
    read vivid
  fi
}

ubuntu_xenial(){
  if [ $OS == 'Ubuntu' ] && [ $vers == '16.04' ] ;then
    echo -e "Do you want add repository" $OS $codename "?"
    echo -e "Select your favorit repository: "
    echo -e "1. kambing.ui.ac.id"
    echo -e "2. itb.ac.id"
    echo -e "3. All Repository"

    echo -n "Your choice: "
    read xenial
  fi
}

debian(){
   OS=$(lsb_release -si)
   vers=$(lsb_release -sr)
   codename=$(lsb_release -sc)

   if [ $OS == 'Debian' ] && [ $vers == '6' ] ;then
       return 0;
   elif [ $OS == 'Debian' ] && [ $vers == '7' ] ; then
       return 0;
    elif [ $OS == 'Debian' ] && [ $vers == '8' ] ; then
       return 0;
   else
      echo "Linux: $(lsb_release -si)"
      echo "Version: $(lsb_release -sr)"
   fi
}

if [ "$(id -u)" != "0" ]; then
   echo "Please run as root."
   echo "Usage: sudo $0"
   exit 1;
else
   if ubuntu; then
     echo -e "############################################"
     echo -e "\tAuto Add Repository v.1.0"
     echo -e "    This is Repository for" $OS $vers
     echo -e "############################################"
     if [ $vers == '14.04' ] ; then
         ubuntu_trusty
         echo $trusty
     elif [ $vers == '15.04' ] ; then
         ubuntu_vivid
         echo $vivid
     elif [ $vers == '16.04' ] ; then
         ubuntu_xenial
         echo $xenial
     else
         echo -e "Repository for" $OS $vers "is not available"
     fi
   elif debian; then
     echo -e "############################################"
     echo -e "\tAuto Add Repository v.1.0"
     echo -e "    This is Repository for" $OS $vers
     echo -e "############################################"
   else
      echo "Back"
   fi
fi

