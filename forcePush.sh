#!/bin/bash

oldCommitId=$(git show-ref --hash refs/remotes/origin/main)
# currentTime=$(date +"%H:%M")
currentTime=$(date +"%Y-%m-%d-%H-%M-%S")


git branch "$currentTime"
git switch "$currentTime"
git add -A
git commit -m "$currentTime"
git pull --rebase
git push origin "$currentTime"
gh pr create --title "$currentTime" --body "" 

sleep 80

newCommitId=$(git show-ref --hash refs/remotes/origin/main)
echo "$oldCommitId"
echo "$newCommitId"

if [[ "$oldCommitId" == "$newCommitId" ]]; then
  echo "Merged successfully, Deleting the branch."
  git switch main
  git push origin --delete "$currentTime"
  git branch -D "$currentTime"

else
  echo "Could not be merged succesfully."
fi
