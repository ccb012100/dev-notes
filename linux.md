- Change colors in terminal: `dircolors`
- Reload .bashrc: `source .bashrc`
- useful packages
  - `htop`
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
  - [bat](https://github.com/sharkdp/bat)
  - `fzf`
  - `glances`
- reload `.bashrc`
  - `source ~/.bashrc`
  - `. ~/.bashrc`
  - `exec bash`
  - <https://stackoverflow.com/a/35073891> for explanation of differences
- display system info using `inxi`
  - `inxi -Frmxx`

### vi

- `:q` - exit
- `:wq` - save file and exit
- `o` - new line

### Windows Subsystem for Linux (WSL)

- [Windows Console Colortool](https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/)

### tmux

- toggle full-screen on current pane: `C-b z`
- Resize pane in direction of `<arrow key>`: `C-b C-<arrow key>`
- rename window: `C-b ,`
- show options: `tmux show-options -g`

### Nano

#### switches

- **-B** (backs up the file prior to editing it)
- **-E** (converts tabs to spaces when editing)
- **-c** (constantly show the cursor position stats)
- **-i** (automatically indents new lines to the same position as the previous line)
- **-k** (toggle cut so that it cuts from cursor position instead of the whole line)
- **-m** (provides mouse support to the editor)
- **-v** (opens file as readonly)

### nanorc

- run `nano -V` to check if `--enable-nanorc option` is present
- apply settings to
  - all users:
    - copy `nanorc` to `/etc/nanorc`
  - a single user:
    - copy `nanorc` to `$HOME/.nanorc`
