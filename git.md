# [[Git]]

## Set git to rebase on pull:

> `$ git config --global pull.rebase true`

## Get email

> `$ git config --global user.email`

## Get username

> `$ git config --global user.name`

## Fix author on all commits after SHA

> `$ git rebase -i ####### -x "git commit --amend --author '[USER NAME] \<USER_EMAIL]\>' -CHEAD"`

## Sync fork with original repository

> <https://gist.github.com/CristinaSolana/1885435>

### 1. Clone your fork

> `$ git clone git@github.com:YOUR-USERNAME/YOUR-FORKED-REPO.git`

### 2. Add remote from original repository in your forked repository

> `$ cd into/cloned/fork-repo`  
> `$ git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git`  
> `$ git fetch upstream`

### 3. Updating your fork from original repo to keep up with their changes

> `$ git pull upstream master`

## Remove file from entire branch history

Use `git-filter-repo` (<https://github.com/newren/git-filter-repo>) - do _not_ use `git-filter-branch`

```bash
git filter-repo --invert-paths --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA
```

See GitHub page on [Removing sensitive data from a repository](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository).

## Rebase previous commits

ex. last 3 commits:

```bash
git rebase -i HEAD~3
```

## [[GPG]]

### signing fails

try this to fix $GPG_TTY: <https://stackoverflow.com/a/55993078>

## Status of all repositories

Find all repositories in current directory and display their status

```bash
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} status \;
```
