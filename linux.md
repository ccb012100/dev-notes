# Linux

`CDABLE_VARS`

- aliases for directories

example:

```bash
# Convenient path navigation, e.g., `cd vp`
setopt CDABLE_VARS
vp="/c/Dev/VersionPress/versionpress"
temp="/c/Dev/temp"
```

Display formatted `PATH`

- **sed**

  - `$ sed 's/:/\n/g' <<< "$PATH"`

- **tr**

  - `$ tr ':' '\n' <<< "$PATH"`

- **python**

  - `$ python2 -c "import os; print os.environ['PATH'].replace(':', '\n')"`

`dircolors`

- Change colors in terminal

Reload `.bashrc`

- `source .bashrc`

Set default shell to `zsh`

- `chsh -s $(which zsh)`

useful packages

- `htop`
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [bat](https://github.com/sharkdp/bat)
- `fzf`
- `glances`
- `jq`
- `zsh`

reload `.bashrc`

- `source ~/.bashrc`
- `. ~/.bashrc`
- `exec bash`
- <https://stackoverflow.com/a/35073891> for explanation of differences

display system info using `inxi`

- `inxi -Frmxx`

---

## `vi`

- `:q` - exit
- `:wq` - save file and exit
- `o` - new line

---

## `curl`

`-k`, `--insecure`

> (SSL) This option explicitly allows curl to perform "insecure" SSL connections and transfers. All SSL connections are attempted to be made secure by using the CA certificate bundle installed by default. This makes all connections considered "insecure" fail unless -k, --insecure is used.

---

## Windows Subsystem for Linux (WSL)

[Windows Console Colortool](https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/)

### set Dracula as theme

1. download dracula iTerm theme
1. copy `Dracula.itermcolors` to Colortool's `themes` folder
1. open Windows Command Prompt
1. run cmd `colortool -d Dracula`

---

### package management

- `sudo apt-get install PACKAGE_NAME`

---

## `tmux`

toggle full-screen on current pane: `C-b z`

Resize pane in direction of `<arrow key>`: `C-b C-<arrow key>`

rename window: `C-b ,`

show options: `tmux show-options -g`

---

## Nano

### switches

- **`-B`** (backs up the file prior to editing it)
- **`-E`** (converts tabs to spaces when editing)
- **`-c`** (constantly show the cursor position stats)
- **`-i`** (automatically indents new lines to the same position as the previous line)
- **`-k`** (toggle cut so that it cuts from cursor position instead of the whole line)
- **`-m`** (provides mouse support to the editor)
- **`-v`** (opens file as readonly)

### nanorc

- run `nano -V` to check if `--enable-nanorc option` is present

apply settings to

- all users:
  - copy `nanorc` to `/etc/nanorc`
- a single user:
  - copy `nanorc` to `$HOME/.nanorc`

## zsh

### Oh My Zsh

#### aliases

`$ZSH_CUSTOM` --> `/home/_USER_/.oh-my-zsh/custom/`
default aliases are in `~/.oh-my-zsh/plugins`

- git aliases in `~/.oh-my-zsh/plugins/git/git.plugin.zsh`
- linux command aliases in `~/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh`

add custom alises in `$ZSH_CUSTOM/aliases.zsh`
