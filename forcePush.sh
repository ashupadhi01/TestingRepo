#!/bin/bash

oldCommitId=$(git rev-parse HEAD)
currentTime=$(date +"%H:%M")

git branch "$currentTime"
git add -A
git commit -m "$currentTime"
git push origin "$currentTime"
