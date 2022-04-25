# Windows

- [Windows](#windows)
  - [Getting a window off screen back into view](#getting-a-window-off-screen-back-into-view)
  - [Remap left `Caps Lock` to `Ctrl`](#remap-left-caps-lock-to-ctrl)
  - [Royal TS slow startup](#royal-ts-slow-startup)
  - [Windows Startup folder](#windows-startup-folder)
  - [[[VS Code]]](#vs-code)
    - [Settings files](#settings-files)
    - [Set VS Code as Git diff tool](#set-vs-code-as-git-diff-tool)
  - [Azure Data Studio](#azure-data-studio)
    - [Settings files](#settings-files-1)
  - [Utilities](#utilities)
  - [Environment variables](#environment-variables)

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

Located at `C:\Users\<UserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

1. `Win + R`
2. Enter `shell:startup` in Run window

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
- **Link Shell Extension**
  - <https://schinagl.priv.at/nt/hardlinkshellext/linkshellextension.html>
    - **Clink**
  - <https://chrisant996.github.io/clink/>
- **Polsedit**
  - <https://www.southsoftware.com/polsedit.html>
- **Meld**
  - <https://meldmerge.org/>
- **KDiff3**
  - <https://download.kde.org/stable/kdiff3/>

## Environment variables

`%PATH%`

`%TEMP%`/`%TMP%`

`%HOMEPATH%`

## Windows Defender

### Fixing messages **Some settings are managed by your organization** or **This setting is managed by your administrator**

1. Open **Registry Editor** (`regedit.exe`)
2. Go to `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender`
3. Export the `Windows Defender` branch.
4. Delete the `Windows Defender` branch.
5. Restart `explorer.exe`.

_source_: <https://www.winhelponline.com/blog/windows-defender-disabled-real-time-protection-virus/>

## Windows 11 Taskbar grouping

Open `regedit.exe` and navigate to `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced`

Edit `TaskbarGlomLevel`:

- `0` Always combine, hide labels (default
- `1` Combine when taskbar is full/Show labels
- `2` Never combine/Show labels
