#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -d ./scribus79.github.io

# if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd ./scribus79.github.io/

# Check status
git status

# Add changes to git.
git add --all
#git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
#git push

git push origin master

