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
  - [tar files](#tar-files)
    - [create tar file](#create-tar-file)
    - [view contents of tar file](#view-contents-of-tar-file)
    - [extract tar file](#extract-tar-file)
  - [Symbolic links (symlinks)](#symbolic-links-symlinks)
    - [Create](#create)
    - [Delete](#delete)

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

## tar files

### create tar file

```bash
tar czvf file.tar.gz destination-folder
```

### view contents of tar file

```bash
tar -ztvf file.tar.gz
```

### extract tar file

```bash
tar -xzvf file.tar.gz

tar -xzvf file.tar.gz -C /directory
```

## Symbolic links (symlinks)

### Create

```bash
ln -s my_file.txt my_link.txt
```

`-f` or `--force` to overwrite existing destination

### Delete

```bash
unlink symlink_to_remove
# or
rm symlink_to_remove
```
