#!/bin/sh

# If a command fails then the deploy stops
set -e
set -x

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Add changes to git.
git add .

# Commit changes.
git commit -m "$*"

# Push site source.
git push origin master
