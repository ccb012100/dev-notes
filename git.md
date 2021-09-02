# [[Git]]

## Set git to rebase on pull:

```bash
git config --global pull.rebase true
```

## Set fast forward as default

```bash
# merge
git config --global merge.ff only

# pull
git config --global pull.ff only
```

## Get email

```bash
git config --global user.email
```

## Get username

```bash
git config --global user.name
```

## Sync fork with original repository

<https://gist.github.com/CristinaSolana/1885435>

### 1. Clone your fork

```bash
git clone git@github.com:YOUR-USERNAME/YOUR-FORKED-REPO.git
```

### 2. Add remote from original repository in your forked repository

```bash
cd into/cloned/fork-repo`  

git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git`  

git fetch upstream
```

### 3. Updating your fork from original repo to keep up with their changes

```bash
git pull upstream master
```

## removes local feature branches that have already been merged

- `$ git branch --merged | grep -v "\*" | grep "feature/*" | xargs -n 1 git branch -d`

## remove remote branches that have been merged

- `$ git remote prune origin --dry-run`

## remove local branches that have no remote

- `$ git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D`

## Changing history

## Fix author on all commits after SHA

```bash
git rebase -i ####### -x "git commit --amend --author '[USER NAME] \<USER_EMAIL]\>' -CHEAD"
```

### change author for all matching commits

```bash
git filter-branch --env-filter '
WRONG_EMAIL="john_doe@github.com"
NEW_NAME="Christopher Bocardo"
NEW_EMAIL="ccb012100@users.noreply.github.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```

### amend commit to current time

- `$ GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"`

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
