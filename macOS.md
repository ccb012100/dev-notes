# macOS

## Application Preferences

Applications store preferences in `*.plist` files in the directory  `$HOME/Library/Preferences/`

## Outlook

### group messages by conversation

> `View` -> `Show as Conversations`

## rsync

The version of rsync that comes with macOS is old, so it's best to download a newer version through homebrew.

- `-t` preserve timestamps
- `-r` recursive sync directories

## Emacs

### enable C-M-d

run in the terminal:

```zsh
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
```

## modifying config through Terminal

```zsh
# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
```

## vscode

### Bell sound on Ctrl+/ keybinding

```bash
$ mkdir -p ~/Library/KeyBindings

$ cat > ~/Library/KeyBindings/DefaultKeyBinding.dict <<EOF
{
  "^/" = "noop";
}
EOF
```

<https://stackoverflow.com/questions/45904944/how-to-turn-off-bell-sound-in-visual-studio-code>

<https://github.com/atom/atom/issues/1669#issuecomment-135503562>

<https://github.com/microsoft/vscode/issues/44070#issuecomment-799716362>

## GPG

1. Run `brew install gnupg pinentry-mac`
2. Add `pinentry-program /usr/local/bin/pinentry-mac` to `~/.gnupg/gpg-agent.conf`
3. Restart gpg-agent by running `gpgconf --kill gpg-agent`

Links:

- <https://gist.github.com/lucko/bc2ba1f684bdce2b8cdcd8442e541e0e>
- <https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b>

## Finder

### Set current folder settings as default view options

`⌘+J` to open the settings, then click the button at the bottom labeled *Use as defaults*

### Keyboard Shortcuts

- `⌘+⌥+H`: Go to Home folder
- `⌘+<UpArrow>`: Go up one directory
- `⌘+Shift+N`: Create new folder
- `⌘+⌥+T`: Toggle toolbar
- `⌘+,`: Preferences
- `Space`: Preview selected file

### Add ssh keyphrase to keychain

This applies to:

- An issue where git commands in vscode fail because it won't recognize the ssh keyphrase
- Git on the terminal keeps asking for the ssh keyphrase

#### Solution

Run the command `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`

### Maximizing windows

Holding `option` and `shift` while clicking the green `+` in the upper-left corner will maximize the window.

Clicking the mouse on the edge of a window will cause that side to expand to the edge of the screen.

Clicking on the corner will expand both of the sides that meet to form that corner.

## Fix wireless device lag

Running my **Logitech MX Master 3S** with the 2.4GHz dongle, but supposedly people have also encountered this issue with Bluetooth (and on the **MX
Keys** keyboard)

To fix it, run the command:

```bash
sudo defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

```

To revert the change:

```bash
sudo defaults delete /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt
```

## Keycodes

**macOS** maps some keys to other keycodes:

| Key | macOS |
| - | - |
| `SysRq/Print Screen` | `F13` |
| `Scroll Lock` | `F14` |
| `Pause Break` | `F15` |

> [!NOTE]
> **Karabiner Events Viewer** will report the hardware key code, but if you go the **macOS** System Settings Keyboard Shortcuts and set a shortcut
> using one of the keys, you'll see that it uses the Function key code.

## Screenshots

| Action | Shortcut |
| - | - |
| Save picture of screen as a file | ⇧⌘3 |
| Copy picture of screen to the clipboard | ⌃⇧⌘3 |
| Save picture selected area as a file | ⇧⌘4 |
| Save picture selected area to the clipboard | ⌃⇧⌘4 |
| Screenshot and recording options | ⇧⌘5 |

## `plutil`

Property List Utility

### Convert plist to JSON format

```zsh
plutil -convert json FILE.plist TARGET_FILE.json
```

### Print plist in human-readable format

```zsh
plutil -p FILE.plist
```

## `caffeinate`

Built-in CLI utility to keep a Mac from sleeping.

### Syntax

`caffeinate [-disu] [-t timeout] [-w pid] [utility arguments...]`

### Flags

- `-d`
  - Create an assertion to prevent the display from sleeping
- `-i`
  - Create an assertion to prevent the system from idle sleeping.
- `-m`
  - Create an assertion to prevent the disk from idle sleeping.
- `-s`
  - Create an assertion to prevent the system from sleeping. This assertion is valid only when system is running on AC power.
- `-u`
  - Create an assertion to declare that user is active. If the display is off, this option turns the display on and prevents the display from going into idle sleep. If a timeout is not specified with `-t` option, then this assertion is taken with a default of 5 second timeout.
- `-t SECONDS`
  - Specifies the timeout value in seconds for which this assertion has to be valid. The assertion is dropped after the specified timeout. Timeout value is not used when an utility is invoked with this command.
- `w PID`
  - Waits for the process with the specified pid to exit. Once the  the process exits, the assertion is also released. This option is ignored when used with utility option.

```zsh
# Prevent sleep for 1 hour (3600 seconds)
caffeinate -u -t 3600
```

### See remaining time

Run the command `pmset -g assertions`. The output should be similar to:

```console
2024-07-24 13:11:34 -0500
Assertion status system-wide:
  --- snip ---
Listed by owning process:
  --- snip ---
  pid 54360(caffeinate): [0x00023c740009a717] 00:12:05 UserIsActive named: "caffeinate command-line tool"
        Details: caffeinate asserting for 3600 secs
        Localized=THE CAFFEINATE TOOL IS PREVENTING SLEEP.
        Timeout will fire in 2874 secs Action=TimeoutActionRelease
No kernel assertions.
```

### Utility arguments

```zsh
# Make caffeinate fork a process, exec "make" in it, and hold an assertion
# that prevents idle sleep as long as that process is running
caffeinate -i make
```

## Get the Bundle ID of an app

Run the command `osascript -e 'id of app "APP_NAME"'

Example:

```zsh
❯ osascript -e 'id of app "Visual Studio Code"'
com.microsoft.VSCode
❯ osascript -e 'id of app "WezTerm"'
```
