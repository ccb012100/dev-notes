## Git Bash

- `C:\Program Files\Git\etc\profile.d\aliases.sh`
- `C:\Program Files\Git\etc\profile.d\`
- `C:\Program Files\Git\etc\bash.bashrc`

### Configuration

- Config file location: %USERPROFILE%/.gitconfig
- [Atlassian page](https://www.atlassian.com/git/tutorials/setting-up-a-repository/git-config) on git config:
- Change the directory new windows open in: <https://stackoverflow.com/a/32125911>
- Set Notepad++ as the text editor:
  - `git config --global core.editor "'C:/Program Files (x86)/Notepad++/notepad++.exe' -multiInst -notabbar -nosession -noPlugin"`
- Set TortoiseGit as diff and merge tool: <https://stackoverflow.com/a/16494703>
- Prompt customization file is located in `C:\Program Files\Git\etc\profile.d\git-prompt.sh`

### Show current branch in CLI

- <https://askubuntu.com/a/730758>

### Set TortoiseGit diff and merge tools

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
