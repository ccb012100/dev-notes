# notes
various notes/documentation

## Linux

* Change colors in terminal: <https://askubuntu.com/a/466203>
* Reload .bashrc: ``source .bashrc``

## Nano

### switches

* **-B** (backs up the file prior to editing it)
* **-E** (converts tabs to spaces when editing)
* **-c** (constantly show the cursor position stats)
* **-i** (automatically indents new lines to the same position as the previous line)
* **-k** (toggle cut so that it cuts from cursor position instead of the whole line)
* **-m** (provides mouse support to the editor)
* **-v** (opens file as readonly)

### nanorc

* run `nano -V` to check if --enable-nanorc option is present
* apply settings to
  * all users:
    * copy ``nanorc`` to the /etc/nanorc
  * a single user:
    * copy ``nanorc`` to ``$HOME/.nanorc``

## Git

### Configuration

* Config file location: %USERPROFILE%/.gitconfig
* Atlassian page on git config: <https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config>
* Change the directory new windows open in: <https://stackoverflow.com/a/32125911>
* Set Notepad++ as the text editor:
  * ``git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"``
* Set TortoiseGit as diff and merge tool: <https://stackoverflow.com/a/16494703>
* Prompt customization file is located in ``C:\Program Files\Git\etc\profile.d\git-prompt.sh``

#### Set TortoiseGit diff and merge tools

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
