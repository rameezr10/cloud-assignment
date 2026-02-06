#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Commit message is missing."
    exit 1
fi

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Current directory is not a Git repository."
    exit 1
fi

git add .
git commit -m "$1"
git push -u origin $(git branch --show-current)

echo "Success: Changes have been staged, committed, and pushed."
