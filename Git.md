# [[Git]]

- [\[\[Git\]\]](#git)
  - [Commits](#commits)
    - [`amend`](#amend)
      - [Add files to commit](#add-files-to-commit)
      - [Change commit message](#change-commit-message)
    - [undo last commit](#undo-last-commit)
    - [change author for all matching commits](#change-author-for-all-matching-commits)
    - [amend commit to current time](#amend-commit-to-current-time)
    - [Sign commits with SSH](#sign-commits-with-ssh)
    - [Unstage all files](#unstage-all-files)
  - [Config](#config)
    - [Set git to rebase on pull:](#set-git-to-rebase-on-pull)
    - [Set fast forward as default](#set-fast-forward-as-default)
    - [Get email](#get-email)
    - [Get username](#get-username)
    - [`Include` directive](#include-directive)
    - [Relative path to diff/merge tool](#relative-path-to-diffmerge-tool)
  - [Get repository name](#get-repository-name)
  - [`$GIT_DIR`](#git_dir)
  - [Sync fork with original repository](#sync-fork-with-original-repository)
    - [1. Clone your fork](#1-clone-your-fork)
    - [2. Add remote from original repository in your forked repository](#2-add-remote-from-original-repository-in-your-forked-repository)
    - [3. Updating your fork from original repo to keep up with their changes](#3-updating-your-fork-from-original-repo-to-keep-up-with-their-changes)
    - [Remove file from entire branch history](#remove-file-from-entire-branch-history)
  - [Rebasing](#rebasing)
    - [Rebase initial commit](#rebase-initial-commit)
    - [Rebase previous commits](#rebase-previous-commits)
  - [\[\[GPG\]\]](#gpg)
    - [signing fails](#signing-fails)
  - [Status of all repositories](#status-of-all-repositories)
  - [Interactive `add`](#interactive-add)
    - [Manually edit hunk](#manually-edit-hunk)
  - [Ignore local changes to a tracked file](#ignore-local-changes-to-a-tracked-file)
  - [Branches](#branches)
    - [Delete remote branch](#delete-remote-branch)
    - [Example](#example)
    - [Get branch name](#get-branch-name)
    - [removes local feature branches that have already been merged](#removes-local-feature-branches-that-have-already-been-merged)
    - [remove local branches that have no remote](#remove-local-branches-that-have-no-remote)
    - [Fetch changes from all remotes and locally delete branches to match remote](#fetch-changes-from-all-remotes-and-locally-delete-branches-to-match-remote)
    - [Merge/Rebase terminology](#mergerebase-terminology)
      - [Rebasing](#rebasing-1)
        - [example](#example-1)
      - [Merging](#merging)
        - [example](#example-2)
    - [Checkout specific files from a branch](#checkout-specific-files-from-a-branch)
      - [Checkout to staging area](#checkout-to-staging-area)
      - [Checkout to working area](#checkout-to-working-area)
    - [Checkout changes from one branch to another branch](#checkout-changes-from-one-branch-to-another-branch)
  - [Change CRLF line endings to LF](#change-crlf-line-endings-to-lf)
  - [Executable (`+x`) file](#executable-x-file)
    - [Stage file as executable](#stage-file-as-executable)
    - [Set existing file to executable](#set-existing-file-to-executable)
  - [Check if $PWD is a Git repository](#check-if-pwd-is-a-git-repository)
  - [stash](#stash)
    - [stash specific file(s)](#stash-specific-files)
  - [Hooks](#hooks)
  - [\[\[Windows\]\] installation](#windows-installation)
  - [Logs](#logs)
    - [search logs for commits that added/removed specific text](#search-logs-for-commits-that-addedremoved-specific-text)
  - [Using Multiple git profiles with different ssh keys](#using-multiple-git-profiles-with-different-ssh-keys)
    - [Example Users:](#example-users)
      - [work](#work)
      - [personal](#personal)
  - [List all committers to a repository](#list-all-committers-to-a-repository)
  - [See specific version of a file](#see-specific-version-of-a-file)
  - [Worktrees](#worktrees)
    - [Create a worktree](#create-a-worktree)
    - [Move a worktree](#move-a-worktree)
    - [List worktrees](#list-worktrees)
    - [Delete a worktree](#delete-a-worktree)

## Commits

### `amend`

#### Add files to commit

```bash
# add files
git add .

# amend commit with --no-edit to keep the same commit message
git commit --amend --no-edit
```

#### Change commit message

```bash
git commit --amend -m "this is the new commit message"
```

### undo last commit

```bash
git reset --soft HEAD~1
```

### change author for all matching commits

To change the author for all commits after commit with hash `HASH`:

```bash
# use currently configured author
git rebase HASH -x "git commit --amend --no-edit --reset-author"

# specify author
git rebase HASH -x "git commit --amend --no-edit --author="Author Name <email@example.com>"
```

### amend commit to current time

```bash
GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"
```

### Sign commits with SSH

<https://calebhearth.com/sign-git-with-ssh>

### Unstage all files

`git restore --staged` takes a directory parameter

```bash
git restore --staged :/ # uses 'top magic' according to the docs

git restore --staged .  # has to be run from the repo root dir to get everything
```

## Config

### Set git to rebase on pull:

```bash
git config --global pull.rebase true
```

### Set fast forward as default

```bash
# merge
git config --global merge.ff only

# pull
git config --global pull.ff only
```

### Get email

```bash
git config --global user.email
```

### Get username

```bash
git config --global user.name
```

### `Include` directive

`Include.path` is relative to the configuration file _in which the include directive is located_.

### Relative path to diff/merge tool

Git doesn't support environment variables in the paths to `difftool`/`mergetool`, so you can't use `~` or `!HOME`.

## Get repository name

```bash
basename -s .git `git config --get remote.origin.url`
```

_source:_ <https://stackoverflow.com/a/42543006>

## `$GIT_DIR`

Instead of accessing `$GIT_DIR` directly, use the command `git rev-parse --git-common-directory`; this uses the logic `return $GIT_COMMON_DIR ?? $GIT_DIR ?? .git/`

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

### Remove file from entire branch history

Use `git-filter-repo` (<https://github.com/newren/git-filter-repo>) - do _not_ use `git-filter-branch`

```bash
git filter-repo --invert-paths --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA
```

See GitHub page on [Removing sensitive data from a repository](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository).

## Rebasing

### Rebase initial commit

```bash
git rebase -i --root
```

### Rebase previous commits

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

## Ignore local changes to a tracked file

```bash
git update-index --assume-unchanged $filename
```

_source_: <https://practicalgit.com/blog/make-git-ignore-local-changes-to-tracked-files.html>

## Branches

### Delete remote branch

```bash
# -d can also be used
git push <remote_name> --delete <branch_name>
```

### Example

```bash
git push origin --delete example-branch
```

### Get branch name

`git branch --show-current`

### removes local feature branches that have already been merged

```bash
git branch --merged | grep -v "\*" | grep "feature/*" | xargs -n 1 git branch -d
```

### remove local branches that have no remote

```bash
git branch --v | grep "\[gone\]" | awk '{print $1}' | xargs git branch -D
```

### Fetch changes from all remotes and locally delete branches to match remote

```bash
git fetch --all --prune
```

### Merge/Rebase terminology

#### Rebasing

_**Incoming**_ is the branch you're working on (the branch you're merging)

_**Current**_ is the branch you're merging into (the target branch)

##### example

If you're rebasing `feat` onto `main`, `feat` is the _incoming_ branch, and `main` is the _current_ branch.

#### Merging

_**Current**_ is the branch you're working on (the branch you're merging)

_**Incoming**_ is the branch you're merging into (the target branch)

##### example

If you're merging `feat` into `master`, `feat` is the _incoming_ branch, and _main_ is the _current_ branch.

### Checkout specific files from a branch

#### Checkout to staging area

```bash
git checkout BRANCH -- FILE
```

#### Checkout to working area

```bash
git restore -s BRANCH -- FILE
```

### Checkout changes from one branch to another branch

```bash
git checkout branch1    # on branch1
git checkout branch2    # now on branch2
git checkout branch2 .  # staging area of branch2 now contains the changes from branch1
```

## Change CRLF line endings to LF

```bash
tr -d '\r' < input.txt > out.txt
```

## Executable (`+x`) file

### Stage file as executable

`git add --chmod=+x path/to/file`

### Set existing file to executable

`git update-index --chmod=+x path/to/file`

## Check if $PWD is a Git repository

```bash
if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
  echo "yes"
else
  echo "no"
  return -1
fi
```

_source_: <https://stackoverflow.com/a/2180367>

## stash

```bash
# stash tracked files
git stash # equivalent to `git stash push`

# include ignored and untracked
git stash push -a # --all

# include untracked files
git stash push -u # --include-untracked

# stash only staged files
git stash push -S # --staged

# only stash untracked files
git stash push --only-untracked
```

### stash specific file(s)

```bash
git stash push -- FILE1 FILE2 # can also do `git stash -- FILE` without `push`

# stash an untracked file
git stash push -u -- FILE
```

## Hooks

The default path for the hooks directory in a repository `.git/hooks`, but this can be overridden globally with `core.hooksPath`.

To continue running the repository's hooks, add the following code to the hooks pointed to by `core.hooksPath`:

```bash
# run the repo's local pre-commit hooks if it exists
if [[ -f "$(git rev-parse --git-common-dir)/hooks/pre-commit" ]]; then
    "${GIT_DIR}"/hooks/pre-commit "$@"
fi
```

### Get `.git` directory

Don't use `GIT_DIR` anymore; use `git rev-parse --git-dir`.

_source_: <https://stackoverflow.com/a/53121209>

## [[Windows]] installation

To use Windows Credentials Manager, which will remember the ssh passphrase, when installing **Git for Windows**, choose to:

- Use Windows' built-in OpenSSH
- Install **Git Credential Manager**

## Logs

### search logs for commits that added/removed specific text

a.k.a **the pickaxe**

```bash
# search for string
git log -S <string>

# search by regex
git log -G <pattern>

# search all branches/tags
git log -S --all <string>

# search for branches matching shell glob `<pattern>`
git log -S <string> --branches[=<pattern>]
```

## Using Multiple git profiles with different ssh keys

### Example Users:

#### work

user: `john_doe-company`

organization: `github.com/Company/`

#### personal

email: `jdoe@github.com`

code: `github.com/jdoe/`

1. Edit `~/.ssh/config`

  ```conf
  # personal github account
  Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/personal_private_key
    IdentitiesOnly yes
    AddKeysToAgent yes

  # work github account
  Host github-company
    HostName github.com
    User git
    IdentityFile ~/.ssh/company_private_key
    IdentitiesOnly yes
    AddKeysToAgent yes
  ```

2. Edit `~/.gitconfig`

  ```gitconfig
  [includeIf "gitdir:~/.dotfiles/"]
      path = .config/git/personal.gitconfig
  [includeIf "gitdir:~/work/"]
      path = .config/git/work.gitconfig
  ```

3. Edit `.config/git/personal.gitconfig`

  ```gitconfig
  [user]
      name = John Doe
      email = 123456+jdoe@users.noreply.github.com
      signingkey = ~/.ssh/personal_private_key
  [url "git@github.com:"]
      insteadof = https://github.com/
  ```

4. Edit `.config/git/work.gitconfig`

  ```gitconfig
  [user]
    name = John Doe
    email = john_doe@company.com
    signingkey = ~/.ssh/company_private_key
  [url "git@github-work:Company/"]
    insteadof = https://github.com/Company/
  ```

5. Add private keys to ssh agent

  ```shell
  ssh-add `~/.ssh/personal_private_key`
  ssh-add `~/.ssh/company_private_key`
  ```

6. Verify configuration

  ```bash
  $ ssh -T git@github.com
  Hi jdoe! You've successfully authenticated, but GitHub does not provide shell access.
  $ ssh -T git@github-work
  Hi john_doe-company! You've successfully authenticated, but GitHub does not provide shell access.
  ```

_source_: <https://gist.github.com/oanhnn/80a89405ab9023894df7>

## List all committers to a repository

```bash
git shortlog -s

# all branches
git shortlog -s --all

# sort by number of commits
git shortlog -sn

# show committer email address
git shortlog -se # or git shortlog -s --email
```

## See specific version of a file

```bash
git show COMMIT_SHA:path/to/file
```

## Worktrees

Worktrees are tracking in a project's `.git/worktrees` directory

### Create a worktree

```bash
# Create a new branch BRANCH and check it out
# into a worktree named NAME in the dir PATH
git worktree add -b NAME PATH BRANCH


# Create a worktree from an existing branch BRANCH
# and place it in the dir PATH
git worktree add PATH BRANCH
```

### Move a worktree

```bash
# move a worktree named NAME to PATH
git worktree move NAME PATH
```

### List worktrees

```bash
git worktree list
```

### Delete a worktree

```bash
git worktree remove NAME
```

## Check if `core.untrackedCache` config is supported

```bash
git update-index --untracked-cache
```
