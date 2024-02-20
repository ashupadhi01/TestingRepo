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
pr_info=$(gh pr create --title "$currentTime" --body "") 
pr_number=$(echo "$pr_info" | rev | cut -d'/' -f1 | rev)

sleep 60

pr_info=$(gh pr view --repo "$REPO_NAME" --number "$pr_number" --json)

if [[ "$prs" == "[]" ]]; then
  echo "Merged successfully, Deleting the branch."
  git switch main
  git push origin --delete "$currentTime"
  git branch -D "$currentTime"

else
  echo "COULD NOT MERGE SUCCESFULLY"
fi
