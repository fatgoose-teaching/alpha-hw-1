#!/bin/bash

cfg="src/backref.cfg" 

while IFS= read -r line
do
  if [[ "$line" == *"upstream: "* ]]; then
    upstream=`echo $line | sed 's/upstream: \(.*\)/\1/'`
    echo $duedate
  fi
done < "$cfg"

git remote add upstream $upstream
git fetch upstream main:upstream-main
git fetch origin main:downstream-main

changes=`git diff downstream-main upstream-main`

if [ -z "$changes" ]
then
      echo "Awesome Sauce! No change in the main branch. Clean as a whistle!"
else
    echo "There are changes in your main branch since it was forked from the instructor's repo. Not permitted."
    exit 1
fi
