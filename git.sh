#!/bin/bash

echo -e "What your file want to upload to github?"
echo -e "use . (all folder and file) or -A (all file) for all folder or file"
echo -n "Filename: "
read file

git add $file

echo -n "Commit for this file: "
read commit
git commit -m "$commit"

echo -n "Push as origin (default) or another: "
read origin

git push -u "$origin" master
