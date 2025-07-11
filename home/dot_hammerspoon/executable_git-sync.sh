#!/usr/bin/env bash

REPO_PATH="$1"
REMOTE_NAME="$2"
COMMIT_MESSAGE_TEMPLATE="$3"

cd "$REPO_PATH" || {
    echo "Error: Cannot access repository at $REPO_PATH"
    exit 1
}

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not a git repository"
    exit 1
fi

sync_repo() {
    echo "Starting git sync for $(pwd)"

    # Check if there are any changes to commit
    if [[ -n $(git status --porcelain) ]]; then
        echo "Changes detected, committing..."
        COMMIT_MESSAGE=$(eval echo "\"$COMMIT_MESSAGE_TEMPLATE\"")
        git add .
        git commit -m "$COMMIT_MESSAGE"
        if [[ $? -eq 0 ]]; then
            echo "Changes committed successfully"
        else
            echo "Error committing changes"
            return 1
        fi
    else
        echo "No changes to commit"
    fi

    # Fetch and pull from remote
    echo "Fetching from remote..."
    git fetch "$REMOTE_NAME"
    if [[ $? -eq 0 ]]; then
        echo "Pulling changes..."
        git pull "$REMOTE_NAME" $(git branch --show-current) --rebase
        if [[ $? -eq 0 ]]; then
            echo "Pull completed successfully"
        else
            echo "Error during pull"
            return 1
        fi
    else
        echo "Error fetching from remote"
        return 1
    fi

    # Push to remote
    echo "Pushing to remote..."
    git push "$REMOTE_NAME" $(git branch --show-current)
    if [[ $? -eq 0 ]]; then
        echo "Push completed successfully"
    else
        echo "Error during push"
        return 1
    fi

    echo "Git sync completed successfully"
}

sync_repo
