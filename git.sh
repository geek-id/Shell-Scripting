#!/bin/bash

echo -e "Simple tools Git Clone and Push"

echo -e "1) Git Clone"
echo -e "2) Git Push"
echo -e "3) Git Remote"

echo -e "\nUse 'q' for quit"
echo -n "Your choice: "
read choice


case "$choice" in
   1)
      echo -e "Do you want clone some project?"
      echo -e "\nUse 'q' for quit"
      echo -n "Enter URL clone here: "
      read url
      regex='(https?|ssh)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

      if [[ $url =~ $regex ]]; then
         git clone $url
      else
          if [ $url == 'q' ]; then
	      exit 0;
          fi

         echo -e "Invalid URL for Git Clone"
      fi

      ;;
   2)
      echo -e "What your file want to upload?"
      echo -e "use : \n. (all folder and file) \n-A (all file) \nOr you can type filename ex. \"git.sh\" or \"git*\""
      echo -n "Filename: "
      read file

      git add $file
      echo -n "Commit for this file: "
      read commit
      git commit -m "$commit"

      echo -n "Push as origin (default) or another [Press Enter to use default]: "
      read origin

      if [ -z "$origin" ];then
         origin="origin"    
         git push -u "$origin" master
      else
         git push -u "$origin" master
      fi
      ;;

    3)
      echo -e "\nRemote some project?"
      echo -e "\nUse 'q' for quit"
      echo -n "Enter URL remote here: "
      read remote
      regex='(https?|ssh)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

      if [[ $remote =~ $regex ]]; then
         git remote add origin $remote
      else
          if [ $remote == 'q' ]; then
            exit 0;
          fi

         echo -e "Invalid URL for Git Remote"
      fi

      ;;
    q)
      exit 0;
      ;;
    *)
      echo -e "Wrong choice"
      exit 1
      ;;
esac
