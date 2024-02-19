#!/bin/bash

oldCommitId=$(git show-ref --hash refs/remotes/origin/main)
currentTime=$(date +"%H:%M")


git branch "$currentTime"
git switch "$currentTime"
git add -A
git commit -m "$currentTime"
newCommitId=$(git rev-parse HEAD)
git pull --rebase
git push origin "$currentTime"
gh pr create --title "" --body "" 

sleep 6

if [[ "$oldCommitId" == "$newCommitId" ]]; then
  echo "Merged successfully, Deleting the branch."
  git push origin --delete "$currentTime"

else
  echo "Could not be merged succesfully."
fi
