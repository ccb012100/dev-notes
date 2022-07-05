# [[Zsh]]

## Oh My Zsh

### aliases

`$ZSH_CUSTOM` --> `/home/_USER_/.oh-my-zsh/custom/`
default aliases are in `~/.oh-my-zsh/plugins`

- git aliases in `~/.oh-my-zsh/plugins/git/git.plugin.zsh`
- [[Linux]] command aliases in `~/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh`

add custom alises in `$ZSH_CUSTOM/aliases.zsh`

### cdablevars

aliases for directories

_example:_

```bash
# Convenient path navigation, e.g., `cd vp`
setopt cdablevars
vp="/c/Dev/VersionPress/versionpress"
temp="/c/Dev/temp"
```

## Zsh history not being saved to HISTFILE

Check and make sure that both `HISTSIZE` and `SAVEHIST` are set. For some reason, I keep losing `SAVEHIST` from my
`.zshrc`.
