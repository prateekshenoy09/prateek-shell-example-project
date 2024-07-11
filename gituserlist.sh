#!/bin/bash

API_URL="https://api.github.com"
USERNAME="$username"
TOKEN="$token"

REPO_OWNER="$1"
REPO_NAME="$2"


collaborators=$(curl -s -u "${USERNAME}:${TOKEN}" "${API_URL}/repos/${REPO_OWNER}/${REPO_NAME}/collaborators" | jq -r '.[] | select(.permissions.push == true) |  .login')

if [[ -z "$collaborators"  ]]; then
        echo " No users with read access ${REPO_OWNER}/${REPO_NAME}."

else
        echo " listing users with read access ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
fi
