# Linux

## grep

### search a directory recursively

```bash
$ grep -nr '{search-term}' directory-name
```

- `-n`
  - Show relative line number in the file
- `-r`
  - Recursively search subdirectories listed
- `search-term`
  - String for search
- `directory-name`
  - Directory for search

## Display formatted `PATH`

### **sed**

`$ sed 's/:/\n/g' <<< "$PATH"`

### **tr**

`$ tr ':' '\n' <<< "$PATH"`

### **python**

`$ python2 -c "import os; print os.environ['PATH'].replace(':', '\n')"`

## Set default shell to `zsh`

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

## zsh

### Oh My Zsh

#### aliases

`$ZSH_CUSTOM` --> `/home/_USER_/.oh-my-zsh/custom/`
default aliases are in `~/.oh-my-zsh/plugins`

- git aliases in `~/.oh-my-zsh/plugins/git/git.plugin.zsh`
- linux command aliases in `~/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh`

add custom alises in `$ZSH_CUSTOM/aliases.zsh`

#### `cdablevars`

aliases for directories

_example:_

```bash
# Convenient path navigation, e.g., `cd vp`
setopt cdablevars
vp="/c/Dev/VersionPress/versionpress"
temp="/c/Dev/temp"
```

## CentOS

### services

*systemctl*

`$ sudo systemctl start application.service`

`$ sudo systemctl start application`

`$ sudo systemctl stop application.service`

`$ sudo systemctl reload-or-restart application.service`

`$ systemctl status application.service`

`$ systemctl is-active application.service`

`$ systemctl is-failed application.service`

### package management

*yum*

`$ yum help`

`$ yum list [available|installed|all|kernel]`

`$ yum info package-name`

`$ yum search package-name`

`$ yum update`

`$ yum yum update package-name`

`$ yum reinstall package-name`

`$ yum [remove|erase] package-name`

`$ yum autoremove package-name`

`$ yum show-installed`

`$ yum history`

`$ yum clean`

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
