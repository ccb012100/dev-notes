# macOS

- [macOS](#macos)
  - [Outlook](#outlook)
    - [group messages by conversation](#group-messages-by-conversation)
  - [rsync](#rsync)
  - [[[Emacs]]](#emacs)
    - [enable C-M-d](#enable-c-m-d)
  - [modifying config through Terminal](#modifying-config-through-terminal)
  - [[[vscode]]](#vs-code)
    - [Bell sound on Ctrl+/ keybinding](#bell-sound-on-ctrl-keybinding)
  - [[[GPG]]](#gpg)

## Outlook

### group messages by conversation

> `View` -> `Show as Conversations`

## rsync

> `-t` preserve timestamps
>
> `-r` recursive sync directories

## [[Emacs]]

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

## [[vscode]]

### Bell sound on Ctrl+/ keybinding

<https://stackoverflow.com/questions/45904944/how-to-turn-off-bell-sound-in-visual-studio-code>

<https://github.com/atom/atom/issues/1669#issuecomment-135503562>

<https://github.com/microsoft/vscode/issues/44070#issuecomment-799716362>

Add

```text
{
    "^/": "noop:";
}
```

to `~/Library/KeyBindings/DefaultKeyBinding.dict`

## [[GPG]]

1. Run `brew install gnupg pinentry-mac`
2. Add `pinentry-program /usr/local/bin/pinentry-mac` to `~/.gnupg/gpg-agent.conf`
3. Restart gpg-agent by running `gpgconf --kill gpg-agent`

Links:

- <https://gist.github.com/lucko/bc2ba1f684bdce2b8cdcd8442e541e0e>
- <https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b>
