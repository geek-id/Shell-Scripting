#!/bin/bash

echo -e "Simple tools Git"

echo -e "1) Git Clone"
echo -e "2) Git Push"

echo -n "Your choice: "
read choice


case "$choice" in
   1)
      echo -e "Do you want clone some project?"
      echo -n "Enter URL here: "
      read url
      regex='(https?|ssh)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

      if [[ $url =~ $regex ]]; then
         git clone $url
      else
         echo -e "Invalid URL for Git Clone"
      fi
      ;;
   2)
      echo -e "What your file want to upload?"
      echo -e "use . (all folder and file) or -A (all file) for all folder or file"
      echo -n "Filename: "
      read file

      git add $file

      echo -n "Commit for this file: "
      read commit
      git commit -m "$commit"

      echo -n "Push as origin (default) or another: "
      read origin
        
      if [ -z "$origin" ];then
         origin="origin"    
         echo "$origin"
         #git push -u "$origin" master
      else
         # regex='[-A-Za-z0-9\+&@#/%?=~_|!:,.;]'
         # if [[ $origin =~ $regex ]]; then
            #git push -u "$origin" master
            echo "$origin"
         # fi
      fi
      ;;
    *)
      echo -e "Wrong choice"
      exit 1
      ;;
esac
