# Linux

- [Linux](#linux)
  - [Display formatted `$PATH`](#display-formatted-path)
    - [**sed**](#sed)
  - [Set default shell to [[Zsh]]](#set-default-shell-to-zsh)
  - [display system info using `inxi`](#display-system-info-using-inxi)
    - [z - jump around](#z---jump-around)
  - [Nano](#nano)
    - [switches](#switches)
    - [nanorc](#nanorc)
  - [get line count of all code files in a repository](#get-line-count-of-all-code-files-in-a-repository)
  - [find a file and print the contents](#find-a-file-and-print-the-contents)
  - [Utilities](#utilities)
    - [inspect system resources](#inspect-system-resources)
      - [process info](#process-info)
      - [uname](#uname)
      - [/proc](#proc)
    - [Get all environment variables](#get-all-environment-variables)
    - [Get process ID](#get-process-id)
      - [`pidof`](#pidof)
      - [`ps`](#ps)
    - [Kill process](#kill-process)
  - [enable/disable [[Bluetooth]] on boot](#enabledisable-bluetooth-on-boot)
  - [Add/remove fonts](#addremove-fonts)

## Display formatted `$PATH`

### **sed**

```bash
# sed
sed 's/:/\n/g' <<< "$PATH"

#tr
tr ':' '\n' <<< "$PATH" # tr

# python
python2 -c "import os; print os.environ['PATH'].replace(':', '\n')"

# bash parameter substition
echo "${PATH//:/$'\n'}"
```

## Set default shell to [[Zsh]]

```bash
chsh -s $(which zsh)
```

## display system info using `inxi`

```bash
inxi -Frmxx
```

### z - jump around

modify .zshrc [to fix error](https://github.com/rupa/z/issues/230#issuecomment-362297213): `_z_precmd:1: nice(5) failed: operation not permitted`

## Nano

### switches

- **`-B`** backs up the file prior to editing it
- **`-E`** converts tabs to spaces when editing
- **`-c`** constantly show the cursor position stats
- **`-i`** automatically indents new lines to the same position as the previous line
- **`-k`** toggle cut so that it cuts from cursor position instead of the whole line
- **`-m`** provides mouse support to the editor
- **`-v`** opens file as readonly

### nanorc

run `nano -V` to check if `--enable-nanorc option` is present

apply settings to

- all users:
  - copy `nanorc` to `/etc/nanorc`
- a single user:
  - copy `nanorc` to `$HOME/.nanorc`

## get line count of all code files in a repository

```bash
find */** -type f \( -iname \*.cs -o -iname \*.js -iname \*.ts -name \*.cshtml \) -print0 \
| xargs -0 wc -l \
| grep -v 'total$' \
| sort -nr > ca_line_counts.txt
```

- `-type f` - files only (exlude directories and symbolic links)
- `-iname \*.cs` - files with name matching the pattern `*.cs`
- `-o` - OR
- `print0` - from `find` man page: "print the full file name on the standard output, followed by a null character (instead of
  the newline character that -print uses). This allows file names that contain newlines or other types of white space to be correctly interpreted by programs process the find output. This option corresponds to the -0 option of xargs."
- `xargs -0` - From the `xargs` man page: "Change `xargs` to expect NUL (`\0`) characters as separators, instead of spaces and newlines. This is expected to be used in concert with the `-print0` function in `find(1)`."
- `sort -n` - numeric sort
- `sort -r` - reverse sort

## find a file and print the contents

```bash
find -name $FILE_NAME -exec cat {} \;
```

## Utilities

### inspect system resources

#### process info

`top`, `htop`

#### uname

Print operating system info.

`uname -a`

#### /proc

The `/proc` directory contains files with hardware info.

ex. `cat /proc/cpuinfo`

### Get all environment variables

Use the `set` command.

### Get process ID

#### `pidof`

e.g.

```bash
pidof slack
```

#### `ps`

`ps aux | grep -i "PROGRAM_NAME"`

Type `pidof<TAB>` to get autocompletion of application names.

### Kill process

```bash
sudo kill -9 PROCESS_ID

sudo kill -9 `pidof PROGRAM_NAME`

killall PROGRAM_NAME
```

## enable/disable [[Bluetooth]] on boot

- Run command `sudo vim /etc/bluetotth/main.conf`
- Change the line `AutoEnable=false` to `AutoEnable=true`

## Add/remove fonts

Fonts are located in `/usr/share/fonts` and `~/.local/share/fonts`.

After adding or removing fonts, run command `fc-cache -f` to update your font cache.
