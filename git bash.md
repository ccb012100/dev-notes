# git bash

[[Git]] Bash shell for [[Windows]]

- [git bash](#git-bash)

  - [Customize prompt](#customize-prompt)
    - [Liquidprompt](#liquidprompt)
      - [Installation](#installation)
      - [Add to ~/.bashrc](#add-to-bashrc)
  - [Configuration](#configuration)
  - [Show current branch in CLI](#show-current-branch-in-cli)
  - [Set TortoiseGit diff and merge tools](#set-tortoisegit-diff-and-merge-tools)
  - [Signing commits with [[GPG]]](#signing-commits-with-gpg)
    - [Increase [[GPG]] passphrase ttl in GPG4Win](#increase-gpg-passphrase-ttl-in-gpg4win)

## Customize prompt

### Liquidprompt

#### Installation

Release branch

```bash
git clone --branch stable https://github.com/nojhan/liquidprompt.git ~/liquidprompt
```

Development (non-stable) branch

```bash
git clone https://github.com/nojhan/liquidprompt.git ~/liquidprompt
```

#### Add to ~/.bashrc

```bash
# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
```

## Configuration

- `C:\Program Files\Git\etc\profile.d\aliases.sh`
- `C:\Program Files\Git\etc\profile.d\`
- `C:\Program Files\Git\etc\bash.bashrc

- `.gitconfig` location: `%USERPROFILE%/.gitconfig`
- [Atlassian page](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config) on git config:
- Change the directory new windows open in: <https://stackoverflow.com/a/32125911>
- Set **Notepad++** as the text editor:
  - `git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`
- Set **TortoiseGit** as `diff` and `merge` tool: <https://stackoverflow.com/a/16494703>
- Prompt customization file is located in `C:\Program Files\Git\etc\profile.d\git-prompt.sh`

## Show current branch in CLI

- <https://askubuntu.com/a/730758>

## Set TortoiseGit diff and merge tools

```bash
[diff]
tool = tortoisediff
[difftool]
prompt = false
[merge]
tool = tortoisemerge
[mergetool]
prompt = false
keepBackup = false
[difftool "tortoisediff"]
cmd = \""c:/Program Files/TortoiseGit/bin/TortoiseGitMerge.exe"\" -mine "$REMOTE" -base "$LOCAL"
[mergetool "tortoisemerge"]
cmd = \""c:/Program Files/TortoiseGit/bin/TortoiseGitMerge.exe"\" -base "$BASE" -theirs "$REMOTE" -mine "$LOCAL" -merged "$MERGED"
```

## Signing commits with [[GPG]]

[[WINDOWS] How to enable auto-signing Git commits with GnuPG for programs that don't support it natively
](https://gist.github.com/BoGnY/f9b1be6393234537c3e247f33e74094a#windows-how-to-enable-auto-signing-git-commits-with-gnupg-for-programs-that-dont-support-it-natively)

The most important thing to note: if `GPG4Win` is installed, it will conflict with Git Bash's version of GPG. To fix, run the command `git config --global gpg.program "/c/Program Files/Git/usr/bin/gpg.exe"` to configure Git to use the Git Bash version.

### Increase [[GPG]] passphrase ttl in GPG4Win

To modify `default-cache-ttl` and `max-cache-ttl` in the **Kleopatra** GUI: <https://stackoverflow.com/a/66821816>
