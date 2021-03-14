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
  git fetch upstream master:upstream-master

  changes=`git diff upstream-master master`

  if [ -z "$changes" ]
  then
        echo "no changes in master branch"
  else
      echo "there's changes in master"
      exit 1
  fi
}

