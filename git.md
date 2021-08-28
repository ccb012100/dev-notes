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

```bash
git filter-branch -f \
    --prune-empty \
    --tag-name-filter cat \
    --tree-filter 'rm -f .gitconfig' \
    $(git log --follow --find-renames=40% --diff-filter=A --format=%H -- .gitconfig)~..HEAD
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

## [[GPG]]

### signing fails

try this to fix $GPG_TTY: <https://stackoverflow.com/a/55993078>

#### debug

echo "test" | gpg --clearsign

### changing password timeout

`~/.gnupg/gpg-agent.conf` contains values (in seconds) to set `cachettl`

### [[MacOS]]

1. Run `brew install gnupg pinentry-mac`
2. Add `pinentry-program /usr/local/bin/pinentry-mac` to `~/.gnupg/gpg-agent.conf`
3. Restart gpg-agent by running `gpgconf --kill gpg-agent`

Links:

- <https://gist.github.com/lucko/bc2ba1f684bdce2b8cdcd8442e541e0e>
- <https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b>

## Status of all repositories

Find all repositories in current directory and display their status

```bash
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} status \;
```
