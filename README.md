# Migration from GitLab to GitHub

## Migrated Items

Migrating a repository data from GitLab to GitHub Enterprise Cloud includes:

* Git source (including commit history)
* Pull requests
* User history for pull requests
* Work item links on pull requests
* Attachments on pull requests
* Branch policies for the repository (user-scoped branch policies and cross-repo branch policies are not included)

## Links
* https://docs.github.com/en/migrations/using-github-enterprise-importer/migrating-from-azure-devops-to-github-enterprise-cloud/about-migrations-from-azure-devops-to-github-enterprise-cloud


## Install CLI

Install [GitHub CLI](https://cli.github.com/)

### set a GitHub Token 

```ps1
[System.Environment]::SetEnvironmentVariable('githubToken','ghp_hirb25Pb7yBenoitGrgaLJeBdBcwCoucouqT')
```

```bash
export GH_TOKEN="ghp_hirb25Pb7yBenoitGrgaLJeBdBcwCoucouqT"
```

### Authentication

```sh
gh auth login
```
### Import a repository

```bash
GITHUB_ORG="bmoussaudms"
REPO_NAME="tinyMediaManager"
SOURCE_REPO_URL="https://gitlab.com/tinyMediaManager/tinyMediaManager.git"

gh repo create $GITHUB_ORG/$REPO_NAME 
```

### Clone the migrated repository locally

```bash
git clone --bare $SOURCE_REPO_URL
```

### Push all to the new location

```bash
git push --mirror https://github.com/${GITHUB_ORG}/${REPO_NAME}.git
```