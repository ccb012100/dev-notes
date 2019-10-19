# macOS

## Outlook

### group messages by conversation

> `View` -> `Show as Conversations`

## rsync

> `-t` preserve timestamps
>
> `-r` recursive sync directories

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

## VS Code

### Bell sound on Ctrl+/ keybinding

<https://stackoverflow.com/questions/45904944/how-to-turn-off-bell-sound-in-visual-studio-code>

<https://github.com/atom/atom/issues/1669#issuecomment-135503562>

Add

```text
{
    "^/": "noop:";
}
```

to `~/Library/KeyBindings/DefaultKeyBinding.dict`
