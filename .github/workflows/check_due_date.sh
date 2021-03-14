#!/bin/bash

cfg="src/backref.cfg" 

while IFS= read -r line
do
  if [[ "$line" == *"assignment: "* ]]; then
    url=`echo $line | sed 's/assignment: \(.*\)/\1/'`
    echo $duedate
  fi
done < "$cfg"

filename=$(basename -- "$url")

wget $url 


while IFS= read -r line
do
  if [[ "$line" == *"due date"* ]]; then
    duedate=`echo $line | sed 's/due date: \(.*\)/\1/'`
    echo $duedate
  fi
done < "$filename"

todate=`TZ=PST8PDT date`

echo "today: $todate"

echo "due date: $duedate"

todateepoch=$(date -d "$todate" +%s)
duedateepoch=$(date -d "$duedate" +%s)

if [ "$todateepoch" -gt "$duedateepoch" ] ;
then
    echo "past due!"
    exit 1
else
    echo "all good"
fi

