## Visual Studio

- Location of `CurrentSettings.vssettings`
  - `%UserProfile%\AppData\Local\Microsoft\VisualStudio\15.0_*\Settings`

### Resharper

- settings file is located at `%AppData%\JetBrains\Shared\vAny\GlobalSettingsStorage.DotSettings`

## VS Code

### Settings files

- `%AppData%\Code\User\keybindings.json`
- `%AppData%\Code\User\settings.json`
- `%AppData%\Code\User\snippets\typescript.json`

#### Export list of Extensions to text

- open Terminal in Code and enter the command `code --list-extensions | xargs -L 1 echo code --install-extension`
- To install the same extensions in a new VS Code environment (new machine, etc.), just take the output from the above and paste into the Terminal (see <https://stackoverflow.com/a/49398449)>

#### Set VS Code as Git diff tool

- add to file `C:\Program Files\Git\mingw64\etc\gitconfig`:

```bash
[difftool "vscode"]
cmd = \"C:\\Program Files\\Microsoft VS Code\\Code.exe\" \"$LOCAL\" \"$REMOTE\" --diff --wait
trustExitCode = false
```
