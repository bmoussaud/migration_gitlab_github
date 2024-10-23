# Migration from GitLab to GitHub

Migrating a repository data from GitLab to GitHub Enterprise Cloud includes:

* Git source (including commit history)
* Git branches
* Tags


## Install CLI

* Install Git CLi
* Install [GitHub CLI](https://cli.github.com/)

## Create a GitHub Personel Access Token (PAT)

Assign the permission depending of the role (Enterprise owner, Organization owner, Migrator).

Use personal access token __classic__ Only.

The Permissions are `admin:org, repo, workflow`

```ps1
$env:GH_PAT="ghp_hirb25Pb7yBenoitGrgaLJeBdBcwCoucouqT"
````

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

### Migration Scripts

`migration_repository.ps1` and `migration_repository.sh` gather all these commands to illustrate the migration of a single repository from GitLab to GitHub.