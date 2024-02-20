# REPO_NAME="ashupadhi01/TestingRepo"
# # Create the PR
# pr_info=$(gh pr create --title "My PR title" --body "My PR description" --repo "$REPO_NAME")

# # Extract the PR number
# pr_number=$(echo "$pr_info" | grep -o 'pull/\d+$' | cut -d'/' -f2)
# echo "$pr_number"

# Check if extraction successful
# if [[ -z "$pr_number" ]]; then
#   echo "Failed to extract PR number."
#   # Handle error
# else
#   echo "PR number: $pr_number"
#   # Use the PR number
# fi

x="https://github.com/ashupadhi01/TestingRepo/pull/27"
pr_number=$(echo "$x" | rev | cut -d'/' -f1 | rev)
echo "$pr_number"