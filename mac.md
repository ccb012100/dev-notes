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

```
$ defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
```

## modifying config through Terminal

```
# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
```
