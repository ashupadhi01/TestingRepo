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
pr_number=$(echo "$pr_info" | rev | cut -d'/' -f1 | rev)

sleep 60

pr_info=$(gh pr view "$pr_number" --json state)
echo "$pr_info"

if grep -q "MERGED" <<< "$pr_info"; then
    echo "Merged successfully, deleting the branch."
    git switch main
    git push origin --delete "$currentTime"
    git branch -D "$currentTime"
else
    echo "Not merged."
fi