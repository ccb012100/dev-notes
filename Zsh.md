# [[Zsh]]

## expand alias

Pressing `C-x a` with your cursor on an alias will trigger `_expand_alias`.

## cdablevars

aliases for directories

_example:_

```bash
setopt cdablevars
conf="~/.config"
# typing `cd conf` will cd to ~/.config
```

## Zsh history not being saved to HISTFILE

Check and make sure that both `HISTSIZE` and `SAVEHIST` are set. For some reason, I keep losing `SAVEHIST` from my
`.zshrc`.
