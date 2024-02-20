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
pr_url=$(gh pr create --title "$currentTime" --body "") 
# pr_number=$(echo "$pr_info" | rev | cut -d'/' -f1 | rev)
status_code=$(curl -s -o /dev/null -w "%{http_code}" "$pr_url")

if [[ $status_code -eq 200 ]]; then
  echo "PR with number $pr_number exists."
else
  echo "PR with number $pr_number not found."
fi

sleep 60

if [[ $status_code -eq 200 ]]; then
  echo "PR with number $pr_number exists."
else
  echo "PR with number $pr_number not found."
fi



# pr_info=$(gh pr view --repo "$REPO_NAME" --number "$pr_number" --json)

# if [[ "$prs" == "[]" ]]; then
#   echo "Merged successfully, Deleting the branch."
#   git switch main
#   git push origin --delete "$currentTime"
#   git branch -D "$currentTime"

# else
#   echo "COULD NOT MERGE SUCCESFULLY"
# fi
