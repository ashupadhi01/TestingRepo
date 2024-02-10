#!/bin/bash

oldCommitId=$(git rev-parse HEAD)
currentTime=$(date +"%H:%M")

git add -A
git commit -m "$currentTime"
git push origin main

sleep 5

newCommitId=$(git rev-parse HEAD)

# echo "$oldCommitId"
# echo "$newCommitId"

if [[ "$oldCommitId" == "$newCommitId" ]]; then
    echo "Test failed."
else 
    echo "Successfully merged"
fi