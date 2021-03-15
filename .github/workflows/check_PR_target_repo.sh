#!/bin/bash

event="/home/runner/work/_temp/_github_workflow/event.json"

while IFS= read -r line
do
  if [[ "$line" == *"pdgetrf"* ]]; then
    echo "PR is against wrong target (it should be from your \"work\" branch towards your master). Not permitted."
    exit 1
  fi
done < "$event"
echo "PR appears to have the correct target. Passed."
