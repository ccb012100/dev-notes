# Windows

## Getting a window off screen back into view

- Hold down the `Shift` key while right-clicking the program in the taskbar
- Select `Move`
- Use the arrow keys to move the window over to the visible desktop

## Remap left `Caps Lock` to `Ctrl`

create file named `keys.reg`:

```reg
; Map Caps Lock to Ctrl
REGEDIT4
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00
```

## Royal TS slow startup

<https://support.royalapplications.com/support/solutions/articles/17000027841-royal-ts-installation-taking-a-very-long-time-or-royal-ts-is-running-slow-in-general>

## Windows Startup folder

`Win + R` -> enter `shell:startup` in Run window

## [[VS Code]]

### Settings files

- `%AppData%\Code\User\keybindings.json`
- `%AppData%\Code\User\settings.json`
- `%AppData%\Code\User\snippets\typescript.json`

### Set VS Code as Git diff tool

- add to file `C:\Program Files\Git\mingw64\etc\gitconfig`:

```bat
[difftool "vscode"]
cmd = \"C:\\Program Files\\Microsoft VS Code\\Code.exe\" \"$LOCAL\" \"$REMOTE\" --diff --wait
trustExitCode = false
```

## Azure Data Studio

### Settings files

- `%AppData%\Roaming\azuredatastudio\User\keybindings.json`
- `%AppData%\Roaming\azuredatastudio\User\settings.json`

## Utilities

- **Everything**
  - <https://www.voidtools.com/>
- **SumatraPDF**
- **PowerToys**
- **ShellMenuView**
  - <http://www.nirsoft.net>
