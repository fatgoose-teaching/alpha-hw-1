#!/bin/bash

cfg="src/backref.cfg" 

while IFS= read -r line
do
  if [[ "$line" == *"upstream: "* ]]; then
    upstream=`echo $line | sed 's/upstream: \(.*\)/\1/'`
    echo $duedate
  fi
done < "$cfg"

check_upstream

check_upstream() {
  echo "upstream is $upstream"

  git remote add upstream $upstream 
  git fetch upstream main:upstream-main

  changes=`git diff upstream-main main`

  if [ -z "$changes" ]
  then
        echo "no changes in main branch"
  else
      echo "there's changes in main"
      exit 1
  fi
}

