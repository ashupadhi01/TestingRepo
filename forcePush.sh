#!/bin/bash

oldCommitId=$(git show-ref --hash refs/remotes/origin/main)
currentCommitId=$(git rev-parse HEAD)
currentTime=$(date +"%H:%M")


git branch "$currentTime"
git switch "$currentTime"
git add -A
git commit -m "$currentTime"
git pull --rebase
git push origin "$currentTime"

sleep 5

if [[ "$oldCommitId" == "$currentCommitId" ]]; then
    echo "Merged successfully"
else
    echo "Could not merge"
fi