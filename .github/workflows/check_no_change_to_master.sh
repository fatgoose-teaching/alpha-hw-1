#!/bin/bash

UPSTREAM=https://github.com/pdgetrf/goose-test.git

git remote add upstream $UPSTREAM 
git fetch upstream master:upstream-master

changes=`git diff upstream-master master`

if [ -z "$changes" ]
then
      echo "no changes in master branch"
else
      echo "there's changes in master"
      exit 1
fi
