# Git

## Commits

### Import one repository (and its history) into another

For example, merging repo `B` into repo `A`:

```bash
# go to repo B
cd ~/src/B
# create a new subdir
mkdir B
# move the files (excluding '.git/', '.github/', etc.) to the subdir
git mv REPO_FILES B/
# commit the changes
git add --all && git commit -m "preparing for merge" && git push
# go to repo A
cd ~/src/A
# track repo B
git remote add B git@github.com@:ccb012100/B.git
# fetch B
git fetch B
# merge in B's 'main' branch
git merge --allow-unrelated-histories B/main
# commit changes
git commit -m "merge in repo B" && git push
```

([source](https://stackoverflow.com/a/20974621))

### `amend`

#### Add files to commit

```bash
# stage files
git add .

# amend commit with --no-edit to keep the same commit message
git commit --amend --no-edit
```

or

```bash
# add unstaged files and amend commit
git commit --all --amend --no-edit
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
# now           c
git commit --amend --no-edit --date=now

# specific time
git commit --amend --no-edit --date "Wed Sep 25 17:23:01 CDT 2024"
```

#### multiple commits

- Start an interactive rebase
- Set each commit to `edit`
- For each commit, amend the commit date and then run `git rebase --continue`

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

([source](https://stackoverflow.com/a/42543006))

### Set config at command-level

To set/override a config value for a single command, use the `-c` flag before the command.

Example:

```bash
# use less as diff pager
git -c pager.diff=less diff

# unset pager.diff
git -c pager.diff= diff
```

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

## GPG

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

([source](https://practicalgit.com/blog/make-git-ignore-local-changes-to-tracked-files.html))

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

([source](https://stackoverflow.com/a/2180367))

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

([source](https://stackoverflow.com/a/53121209))

## Windows installation

To use Windows Credentials Manager, which will remember the ssh passphrase, when installing **Git for Windows**, choose to:

- Use Windows' built-in OpenSSH
- Install **Git Credential Manager**

## Logs

### Search logs for commits that added/removed specific text

a.k.a **the pickaxe**

```bash
# search for string
git log -S STRING

# search by regex
git log -G PATTERN

# search all branches/tags
git log -S --all STRING

# search for branches matching shell glob `<pattern>`
git log -S STRING --branches[=<pattern>]
```

### List deleted files

```bash
git log --diff-filter=D --summary | grep delete
```

### Logs for a specific file

```bash
git log --all --full-history -- FILE_PATH

# fuzzy search
git log --all --full-history -- "**/FILE_NAME>"

# view the file as of a specific commit
git show SHA -- FILE_PATH

# Restore deleted file (note the caret to grab the previous commit)
git checkout SHA_WHERE_FILE_WAS_DELETED^ -- FILE_PATH
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

([source](https://gist.github.com/oanhnn/80a89405ab9023894df7))

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

## Restore a deleted file

Find the SHA for the commit where the file was deleted, and then run the command

```bash
# note the caret to grab the previous commit
git checkout SHA_WHERE_FILE_WAS_DELETED^ -- FILE_PATH
```

## `blame`

### Ignoring commits

```bash
git blame --ignore-rev SHA1 --ingore-rev SHA2 FILE

# Use an ignore-revs file (can be specified multiple times)
git blame --ignore-revs-file IGNORE_REVS_FILE FILE

# set ignore-revs file in repo's config
git config blame.ignoreRevsFile IGNORE_REVS_FILE
```
