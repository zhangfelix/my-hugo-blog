#!/bin/sh

# If a command fails then the deploy stops
set -e
set -x

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t dream # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Back to the site source folder
cd ..

# Add changes to git.
git add .

# Commit changes.
git commit -m "$msg"

# Push site source.
git push origin master