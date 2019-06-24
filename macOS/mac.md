# macOS

## Outlook

### group messages by conversation

> `View` -> `Show as Conversations`

## rsync

> `-t` preserve timestamps
>
> `-r` recursive sync directories

```bash
rsync -t /Users/cbocardo/.emacs /Users/cbocardo/ccb012100/.emacs/

rsync -t /Users/cbocardo/.zshrc /Users/cbocardo/ccb012100/mac-configs/

rsync -t /Users/cbocardo/.zsh_unalias /Users/cbocardo/ccb012100/mac-configs/

rsync -t "/Users/cbocardo/Library/Application Support/Code/User/settings.json" /Users/cbocardo/ccb012100/vscode-settings/macos/

rsync -t "/Users/cbocardo/Library/Application Support/Code/User/keybindings.json" /Users/cbocardo/ccb012100/vscode-settings/macos/
```
