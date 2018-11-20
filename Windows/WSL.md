# Windows Subsystem for Linux (WSL)

[Windows Console Colortool](https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/)

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

## convert CRLF to LF

`$ tr -d '\r' < windows.csv > unix.csv`