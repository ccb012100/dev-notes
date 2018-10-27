# Git

## Set git to rebase on pull:

> `$ git config --global pull.rebase true`

## Get email

> `$ git config --global user.email`

## Get username

> `$ git config --global user.name`

## Fix author on all commits after SHA

> `$ git rebase -i ####### -x "git commit --amend --author '[USER NAME] \<USER_EMAIL]\>' -CHEAD"`

## Sync fork with original repository

><https://gist.github.com/CristinaSolana/1885435>

### 1. Clone your fork

> `$ git clone git@github.com:YOUR-USERNAME/YOUR-FORKED-REPO.git`

### 2. Add remote from original repository in your forked repository

> `$ cd into/cloned/fork-repo`  
> `$ git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git`  
> `$ git fetch upstream`

### 3. Updating your fork from original repo to keep up with their changes

> `$ git pull upstream master`
