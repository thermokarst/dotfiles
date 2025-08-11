#!/usr/bin/env bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "usage: $0 <repo_name> <branch_name>"
    echo "example: $0 k-repo foo-branch1"
    exit 0
fi

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "error: invalid number of arguments"
    echo "usage: $0 <repo_name> <branch_name>"
    echo "run with --help for more information"
    exit 1
fi

REPO_NAME="$1"
BRANCH_NAME="$2"

REPO_PATH="$HOME/Klaviyo/Repos/$REPO_NAME"

if [ ! -d "$REPO_PATH" ]; then
    echo "error: repository directory does not exist: $REPO_PATH"
    exit 1
fi

cd "$REPO_PATH" || exit 1

if [ $# -eq 1 ]; then
    echo "no branch name provided. listing github prs..."
    
    PR_LIST=$(gh pr list --limit 300 --json number,title,headRefName \
        --template '{{range .}}{{.number}} | {{.title}} |{{.headRefName}}{{"\n"}}{{end}}')
    
    if [ -z "$PR_LIST" ]; then
        echo "error: failed to fetch pr list from github"
        exit 1
    fi
    
    SELECTED_PR=$(echo "$PR_LIST" | fzf --delimiter='|' --with-nth=1,2 --prompt='pick a github pr > ' | awk -F'|' '{print $3}')
    
    if [ -z "$SELECTED_PR" ]; then
        echo "no pr selected"
        exit 1
    fi
    
    BRANCH_NAME="$SELECTED_PR"
fi

# Escape branch name for filesystem use
SAFE_BRANCH_NAME=$(echo "$BRANCH_NAME" | sed 's/\//_/g' | sed 's/+/-/g')

PR_NUMBER=""
if [ -n "$BRANCH_NAME" ]; then
    PR_NUMBER=$(echo "$PR_LIST" | grep "|.*$BRANCH_NAME$" | awk -F'|' '{print $1}' | head -1 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
fi

jj git fetch || exit 1
PARENT_DIR="$HOME/projects/work/reviews/$REPO_NAME"
mkdir -p "$PARENT_DIR" || exit 1

if [ -n "$PR_NUMBER" ]; then
    WORKSPACE_DIR="$PARENT_DIR/${PR_NUMBER}_${SAFE_BRANCH_NAME}"
else
    WORKSPACE_DIR="$PARENT_DIR/$SAFE_BRANCH_NAME"
fi

jj workspace add "$WORKSPACE_DIR" -r "$BRANCH_NAME@origin" || exit 1
echo "successfully created workspace for $REPO_NAME/$BRANCH_NAME"

prr get "klaviyo/$REPO_NAME/$PR_NUMBER"
echo "cd $WORKSPACE_DIR && prr edit klaviyo/$REPO_NAME/$PR_NUMBER"
