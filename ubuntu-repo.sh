#!/bin/bash

# Adding new indonesian repository (local repository)

echo -e "#########################################################"
echo -e "##\t\t\t\t\t\t\t##"
echo -e "##\t       Auto Add Repository Indonesia\t        ##"
echo -e "##\t       Ubuntu 16.04 (Xenial Xerus)\t        ##"
echo -e "##  This tools for auto add repository local Indonesia  ##"
echo -e "##\t\t\tv.0.0.1 (beta)\t\t\t##"
echo -e "##\t\t\t\t\t\t\t##"
echo -e "##########################################################"

list=sources.list
#sourcedir=`pwd`
sourcedir=/etc/apt/
#source=`pwd`/sources.list
source=$sourcedir/sources.list
sourcedest="$source".bak

add_kambing(){
  if grep -q 'kambing.ui.ac.id' $source; then
     echo -e "The repo was listed in file sources.list"
     cat $source | grep "kambing"
  else
     sed -i "$ a deb http://kambing.ui.ac.id/ubuntu/ xenial main restricted universe multiverse\ndeb http://kambing.ui.ac.id/ubuntu/ xenial-updates main restricted universe multiverse\ndeb http://kambing.ui.ac.id/ubuntu/ xenial-security main restricted universe multiverse\ndeb http://kambing.ui.ac.id/ubuntu/ xenial-backports main restricted universe multiverse\ndeb http://kambing.ui.ac.id/ubuntu/ xenial-proposed main restricted universe multiverse\n" $source
     cat $source | grep "kambing"
  fi
}

ubuntu_kambing(){
   if [ -e $source ];then
      cp $source $sourcedest
      echo -e "sources.list was backup"
      add_kambing
#   elif [ -e $source ]; then 
#      cp $source $sourcedest
#      echo -e "sources.list was backup"
   else
      cd $sourcedir && touch $list && cat > $list << EOF
### This new Source.list ###
EOF
      add_kambing
   fi
   echo -e "This is repo of kambing.ui.ac.id";

}

add_itb(){
   if grep -q 'ftp.itb.ac.id' $source; then
     echo -e "The repo was listed in file sources.list"
     cat $source | grep "itb"
  else
     sed -i "$ a deb ftp://ftp.itb.ac.id/pub/ubuntu xenial main restricted universe multiverse\ndeb ftp://ftp.itb.ac.id/pub/ubuntu xenial-updates main restricted universe multiverse\ndeb ftp://ftp.itb.ac.id/pub/ubuntu xenial-security main restricted universe multiverse\ndeb ftp://ftp.itb.ac.id/pub/ubuntu xenial-backports main restricted universe multiverse\ndeb ftp://ftp.itb.ac.id/pub/ubuntu xenial-proposed main restricted universe multiverse\n" $source
     cat $source | grep "itb"
  fi
}

ubuntu_itb(){
   if [ -e $source ];then
      cp $source $sourcedest
      echo -e "sources.list was backup"
      add_itb
#   elif [ -e $source ]; then 
#      cp $source $sourcedest
#      echo -e "sources.list was backup"
   else
      cd $sourcedir && touch $list && cat > $list << EOF
### This new Source.list ###
EOF
      add_itb
   fi
   echo -e "This is repo of ftp.itb.ac.id";

}


ubuntu_all(){
   if [ -e $source ];then
      cp $source $sourcedest
      echo -e "sources.list was backup"
      add_kambing
      add_itb
#   elif [ -e $source ]; then 
#      cp $source $sourcedest
#      echo -e "sources.list was backup"
   else
      cd $sourcedir && touch $list && cat > $list << EOF
### This new Source.list ###
EOF
      add_kambing
      add_itb
   fi
   echo -e "This All repo are listed on sources.list";
}

if [ "$(id -u)" != "0" ]; then
    echo "Please run as root."
else
    echo "Do you want add new repository?"
    echo "Avalaible Repository now :"
    echo -e "1) Kambing UI"
    echo -e "2) ITB"
    echo -e "3) All"
    echo -n "Select your repository for adding: "
    read repo
    #echo -e "$repo"

case "$repo" in
   1)
     echo -e "You're now add repository from kambing.ui.ac.id";
     ubuntu_kambing
     ;;
   2)
     echo -e "You're now add repository from ITB";
     ubuntu_itb
     ;;
   3)
     echo -e "You're now add All Repository"
     ubuntu_all
     ;;
   *)
     echo -e "Select the correct choice."
     ;;
esac
    echo -e "Done..."
fi
