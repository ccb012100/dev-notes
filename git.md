# Git

Set git to rebase on pull:

- `git config --global pull.rebase true`

Get email

- `git config --global user.email`

Get username

- `git config --global user.name`

Fix author on all commits after SHA #######

- git rebase -i ####### -x "git commit --amend --author '[USER NAME] \<USER_EMAIL]\>' -CHEAD"