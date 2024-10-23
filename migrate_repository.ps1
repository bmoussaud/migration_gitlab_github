# Define variables
$GITHUB_ORG='bmoussaudms'
$REPO_NAME="tinyMediaManager"
$SOURCE_REPO_URL="https://gitlab.com/tinyMediaManager/tinyMediaManager.git"
$USERNAME='bmousaud'

Set-PSDebug -Trace 0

# check if GitHub Token is set
if (-not $env:githubToken) {
    Write-Host "Please set the environment variable 'githubToken' with a GitHub token"  
    exit 1
}

# Authenticate with GitHub CLI using Token
$env:githubToken | gh auth login --with-token

# Create a new repository on GitHub
gh repo create $GITHUB_ORG/$REPO_NAME --private 

# Clone the repository from GitLab using gh
git clone --bare $SOURCE_REPO_URL 

# change to a directory $REPO_NAME.git
Set-Location "$REPO_NAME.git"

# Push the repository to GitHub using the GitHub CLI
git push --mirror https://github.com/$GITHUB_ORG/$REPO_NAME.git

# Clean up
cd ..

# delete the "$REPO_NAME.git" directory
Remove-Item -Recurse -Force "$REPO_NAME.git"


