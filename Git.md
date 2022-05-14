# [[Git]]

- [[[Git]]](#git)
  - [Set git to rebase on pull:](#set-git-to-rebase-on-pull)
  - [Set fast forward as default](#set-fast-forward-as-default)
  - [Get email](#get-email)
  - [Get username](#get-username)
  - [Sync fork with original repository](#sync-fork-with-original-repository)
    - [1. Clone your fork](#1-clone-your-fork)
    - [2. Add remote from original repository in your forked repository](#2-add-remote-from-original-repository-in-your-forked-repository)
    - [3. Updating your fork from original repo to keep up with their changes](#3-updating-your-fork-from-original-repo-to-keep-up-with-their-changes)
  - [removes local feature branches that have already been merged](#removes-local-feature-branches-that-have-already-been-merged)
  - [remove remote branches that have been merged](#remove-remote-branches-that-have-been-merged)
  - [remove local branches that have no remote](#remove-local-branches-that-have-no-remote)
  - [Changing history](#changing-history)
  - [Fix author on all commits after SHA](#fix-author-on-all-commits-after-sha)
    - [change author for all matching commits](#change-author-for-all-matching-commits)
    - [amend commit to current time](#amend-commit-to-current-time)
  - [Remove file from entire branch history](#remove-file-from-entire-branch-history)
  - [Rebase previous commits](#rebase-previous-commits)
  - [[[GPG]]](#gpg)
    - [signing fails](#signing-fails)
  - [Status of all repositories](#status-of-all-repositories)
  - [Interactive `add`](#interactive-add)
    - [Manually edit hunk](#manually-edit-hunk)
  - [`amend`](#amend)
    - [Add files to commit](#add-files-to-commit)
    - [Change commit message](#change-commit-message)
  - [undo last commit](#undo-last-commit)
  - [Ignore local changes to a tracked file](#ignore-local-changes-to-a-tracked-file)
  - [Delete remote branch](#delete-remote-branch)
    - [Example](#example)
  - [Fetch changes from all remotes and locally delete branches to match remote](#fetch-changes-from-all-remotes-and-locally-delete-branches-to-match-remote)
  - [Change CRLF line endings to LF](#change-crlf-line-endings-to-lf)

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
cd $cloned_fork_repo`

git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git

git fetch upstream
```

### 3. Updating your fork from original repo to keep up with their changes

```bash
git pull upstream master
```

## removes local feature branches that have already been merged

```bash
git branch --merged | grep -v "\*" | grep "feature/*" | xargs -n 1 git branch -d
```

## remove remote branches that have been merged

```bash
git remote prune origin --dry-run
```

## remove local branches that have no remote

```bash
git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D
```

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

```bash
GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"
```

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

## Interactive `add`

`$ git add -i` or `$ git add --interactive`

`status` status output, showing you how many added and removed lines there are in each file

- split up between staged and unstaged changes

`update` stage complete files into the index

`revert` unstage changes from the index (operates on whole files)

`add untracked` add untracked files

`patch` does the same thing as `--patch`

`diff` shows you a diff between the index and `HEAD`

### Manually edit hunk

Enter `e` on the prompt `Stage this hunk [y/n/a/d/K/j/J/e/?]`

To drop `+` line: remove the line

To drop `-` line: change `-` to a single `[space]`)

## `amend`

### Add files to commit

```bash
# add files
git add .

# amend commit with --no-edit to keep the same commit message
git commit --amend --no-edit
```

### Change commit message

```bash
git commit --amend -m "this is the new commit message"
```

## undo last commit

```bash
git reset --soft HEAD~1
```

## Ignore local changes to a tracked file

```bash
git update-index --assume-unchanged $filename
```

_source_: <https://practicalgit.com/blog/make-git-ignore-local-changes-to-tracked-files.html>

## Delete remote branch

```bash
# -d can also be used
git push <remote_name> --delete <branch_name>
```

### Example

```bash
git push origin --delete example-branch
```

## Fetch changes from all remotes and locally delete branches to match remote

```bash
git fetch --all --prune
```

## Change CRLF line endings to LF

`tr -d '\r' input.txt > out.txt`
