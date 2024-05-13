# macOS

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
