# Github Codespaces

<https://docs.github.com/en/codespaces>

## dotfiles

You can specify a dotfiles repository <https://github.com/settings/codespaces> to load when a new Codespace is created.

### Dotfiles location

The dotfiles repository is cloned into `/workspaces/.codespaces/.persistedshare/dotfiles` and runs the file `install.sh`

```bash
$ # Clone & install dotfiles
Cloning into '/workspaces/.codespaces/.persistedshare/dotfiles'...
Executing script /workspaces/.codespaces/.persistedshare/dotfiles/install.sh
```

### `install.sh`

Your dotfiles repo must have a script named `install.sh` at the top-level.

It must be added to Git as an executable file with the command

`git add --chmod=+x -- install.sh`

```bash
codespace-dotfiles main* ❯ git add --chmod=+x -- install.sh
codespace-dotfiles main* ❯ g cm "make install.sh executable"
[main d212b06] make install.sh executable
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 install.sh

codespace-dotfiles main ❯ git ls-files --stage
100644 2a5076024cf8fca833f96192a33c8a5eb9b0f8e5 0 .gitconfig
100644 ab849bc69df4104e479d4f3c40f3cdaf14a0d033 0 README.md
100755 a6e3fb981db6578fa3418467dcd709ee8466ded9 0 install.sh
# 755 means it's executable
```
