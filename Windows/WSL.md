# Windows Subsystem for Linux (WSL)

## .gitconfig

run `$ git config --global core.autocrlf true`

---

## Zsh

add in `.zsh`:

```zsh
#-----------------------------------
# WSL fix for zsh
#-----------------------------------
case $(uname -a) in
    *Microsoft*) unsetopt BG_NICE ;;
esac
```

---
