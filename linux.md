# Linux

- [Linux](#linux)
  - [Display formatted `PATH`](#display-formatted-path)
    - [**sed**](#sed)
    - [**tr**](#tr)
    - [**python**](#python)
  - [Set default shell to [[zsh]]](#set-default-shell-to-zsh)
  - [display system info using `inxi`](#display-system-info-using-inxi)
  - [`curl`](#curl)
    - [z - jump around](#z---jump-around)
  - [Nano](#nano)
    - [switches](#switches)
    - [nanorc](#nanorc)
  - [tar](#tar)
    - [create tar file](#create-tar-file)
  - [view contents of tar file](#view-contents-of-tar-file)
  - [extract tar file](#extract-tar-file)
  - [tmux](#tmux)
    - [List all key bindings](#list-all-key-bindings)
  - [Advanced Package Tool (APT)](#advanced-package-tool-apt)

## Display formatted `PATH`

### **sed**

`$ sed 's/:/\n/g' <<< "$PATH"`

### **tr**

`$ tr ':' '\n' <<< "$PATH"`

### **python**

`$ python2 -c "import os; print os.environ['PATH'].replace(':', '\n')"`

## Set default shell to [[zsh]]

`$ chsh -s $(which zsh)`

useful packages

- [bat](https://github.com/sharkdp/bat)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
- [fzf](https://github.com/junegunn/fzf)
- [glances](https://github.com/nicolargo/glances)
- htop
- jq
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [z - jump around](https://github.com/rupa/z)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

## display system info using `inxi`

`$ inxi -Frmxx`

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

### z - jump around

modify .zshrc [to fix error](https://github.com/rupa/z/issues/230#issuecomment-362297213): `_z_precmd:1: nice(5) failed: operation not permitted`

## Nano

### switches

- **`-B`**
  - backs up the file prior to editing it
- **`-E`**
  - converts tabs to spaces when editing
- **`-c`**
  - constantly show the cursor position stats
- **`-i`**
  - automatically indents new lines to the same position as the previous line
- **`-k`**
  - toggle cut so that it cuts from cursor position instead of the whole line
- **`-m`**
  - provides mouse support to the editor
- **`-v`**
  - opens file as readonly

### nanorc

run `nano -V` to check if `--enable-nanorc option` is present

apply settings to

- all users:
  - copy `nanorc` to `/etc/nanorc`
- a single user:
  - copy `nanorc` to `$HOME/.nanorc`

## tar

### create tar file

`$ tar czvf file.tar.gz destination-folder`

## view contents of tar file

`$ tar -ztvf file.tar.gz`

## extract tar file

`$ tar -xzvf file.tar.gz`

`$ tar -xzvf file.tar.gz -C /directory`

## tmux

### List all key bindings

from outside `tmux`: `$ tmux list-keys`

from inside tmux: `<prefix>:list-keys` or `<prefix>?`

## Advanced Package Tool (APT)

`apt update`

`apt install $PACKAGE_NAME`

`apt search $PACKAGE_NAME`

`apt update`

`apt upgrade`
