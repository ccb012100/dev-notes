# Visual Studio Code and Azure Data Studio

## VS Code

### Settings files

- `%AppData%\Code\User\keybindings.json`
- `%AppData%\Code\User\settings.json`
- `%AppData%\Code\User\snippets\typescript.json`

### Set VS Code as Git diff tool

- add to file `C:\Program Files\Git\mingw64\etc\gitconfig`:

```bash
[difftool "vscode"]
cmd = \"C:\\Program Files\\Microsoft VS Code\\Code.exe\" \"$LOCAL\" \"$REMOTE\" --diff --wait
trustExitCode = false
```

## Azure Data Studio

### Settings files

- `%AppData%\Roaming\azuredatastudio\User\keybindings.json`
- `%AppData%\Roaming\azuredatastudio\User\settings.json`
