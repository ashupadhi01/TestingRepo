pr_number="38"
# echo $(gh pr list --json number | jq '.[] | select(.number == 38)')
# if gh pr view "$PR_NUMBER" --json merged &> /dev/null; then
#     # PR is merged
#     echo "PR #$PR_NUMBER is merged."
#     # Execute actions for merged PR
#     # Example:
#     # echo "Executing actions for merged PR..."
#     # action1
#     # action2
# else
#     # PR is not merged
#     echo "PR #$PR_NUMBER is not merged."
#     # Execute actions for non-merged PR
#     # Example:
#     # echo "Executing actions for non-merged PR..."
#     # action3
#     # action4
# fi

# echo $(gh pr view 35 --json state | jq '.[] | select(.state == "MERGED")')

pr_info=$(gh pr view "$pr_number" --json state)
echo "$pr_info"

if grep -q "MERGED" <<< "$pr_info"; then
    echo "Pr is meged."
else
    echo "Pr is not merged."
fi