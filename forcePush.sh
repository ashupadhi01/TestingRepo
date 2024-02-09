#!/bin/bash

oldCommitId=$(git rev-parse HEAD)
currentTime=$(date +"%H:%M")

git add -A
git commit -m "currentTime"
git push origin main

newCommitId=$(git rev-parse HEAD)

if ["$oldCommitId" = "$newCommitId"]; then
    echo "Test failed"
else 
    echo "Successfully merged"
fi