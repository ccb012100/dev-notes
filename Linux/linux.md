# Linux

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

- [bat](https://github.com/sharkdp/bat)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [fzf](https://github.com/junegunn/fzf)
- [glances](https://github.com/nicolargo/glances)
- `htop`
- `jq`
- [nnn](https://github.com/jarun/nnn)
- [oh-my-zsh](https://ohmyz.sh)
- [Powerline fonts](https://github.com/powerline/fonts)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Spaceship ZSH](https://github.com/denysdovhan/spaceship-prompt)
- [z - jump around](https://github.com/rupa/z)
- `zsh`
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

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

`-i`, `--include`

> Include the HTTP response headers in the output. The HTTP response headers can include things like server name, cookies, date of the document, HTTP version and more...
>
> To view the request headers, consider the `-v`, `--verbose` option.

`-L`, `--location`

- follow redirects

---

## Windows Subsystem for Linux (WSL)

[Windows Console Colortool](https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/)

### set Dracula as theme

1. download dracula iTerm theme
1. copy `Dracula.itermcolors` to Colortool's `themes` folder
1. open Windows Command Prompt
1. run cmd `colortool -d Dracula`

### z - jump around

modify .zshrc [to fix error](https://github.com/rupa/z/issues/230#issuecomment-362297213): `_z_precmd:1: nice(5) failed: operation not permitted`

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

#### `cdablevars`

- aliases for directories

example:

```bash
# Convenient path navigation, e.g., `cd vp`
setopt cdablevars
vp="/c/Dev/VersionPress/versionpress"
temp="/c/Dev/temp"
```
