#!/bin/bash
# set -x
# Check if GH_TOKEN is set
if [ -z "$GH_TOKEN" ];
then
    echo  "GH_TOKEN is not set. Please set the GH_TOKEN environment variable."
    exit 1
fi

# Variables
GITHUB_ORG="bmoussaudms"
REPO_NAME="tinyMediaManager"
SOURCE_REPO_URL="https://gitlab.com/tinyMediaManager/tinyMediaManager.git"
USERNAME=bmousaud


gh auth login --with-token <<< $GH_TOKEN

# Create a new repository on GitHub Enterprise
echo "Creating a new repository on GitHub Enterprise...$GITHUB_ORG/$REPO_NAME"
gh repo create $GITHUB_ORG/$REPO_NAME --private 

# Clone the repository from GitLab
echo "Cloning the repository from GitLab...${SOURCE_REPO_URL}"
git clone --bare $SOURCE_REPO_URL
cd ${REPO_NAME}.git

# Push the repository to GitHub Enterprise
echo "Pushing the repository to GitHub Enterprise...https://github.com/${GITHUB_ORG}/${REPO_NAME}.git"
git push --mirror https://github.com/${GITHUB_ORG}/${REPO_NAME}.git

# Clean up
cd ..
rm -rf ${REPO_NAME}.git
