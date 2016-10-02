#!/bin/bash
# This script for auto update and upgrade

#whoami=`whoami`

if [ "$(id -u)" == "0" ]; then
  echo -e "You're Super User\n"
  echo -n "Do want to update and upgrade system?[Y/n]"
  read answer
  #echo "$answer"
  if [[ $answer =~ ^([y|Y])$ ]]; then
    apt-get update
    echo -e "Now you're update\n"
    echo -n "Do you want to upgrade?[Y/n]"
    read upgrade
    if [[ $upgrade =~ ^([y|Y])$ ]]; then
       apt-get upgrade << CONFIRM
y
CONFIRM
    else
       echo -e "\n=====Update and Upgrade Bash Script=====\n"
       exit 1
    fi
  elif [[ $answer =~ ^([n|N])$ ]]; then
    echo -e "\nThank's for use this script.\n"
  else
    echo -e "\nSorry your input can't read this script.\n"
  fi
else
  echo -e "You're not RooT"
  echo -e "Please run as root\n"
fi
