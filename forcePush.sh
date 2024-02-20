#!/bin/bash
REPO_NAME="ashupadhi01/TestingRepo"

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

prs=$(echo $(gh pr list --state open --repo "$REPO_NAME" --label "" --json number))

if [[ -z "$prs" ]]; then
  echo "Merged successfully, Deleting the branch."
  git switch main
  git push origin --delete "$currentTime"
  git branch -D "$currentTime"

else
  echo "COULD NOT MERGE SUCCESFULLY"
fi
