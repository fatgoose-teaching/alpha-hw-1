#!/bin/bash

cfg="src/backref.cfg" 

while IFS= read -r line
do
  if [[ "$line" == *"upstream: "* ]]; then
    upstream=`echo $line | sed 's/upstream: \(.*\)/\1/'`
    echo $duedate
  fi
done < "$cfg"

echo "upstream is $upstream"

git remote add upstream $upstream 
git fetch upstream main:goose

git branch

changes=`git diff goose origin/main`

if [ -z "$changes" ]
then
      echo "no changes in main branch"
else
    echo "there's changes in main"
    exit 1
fi
