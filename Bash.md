# Bash shell

<!-- cspell:ignore shellopts shopt bashopts euxo pipefail noclobber wxyz stderror inputrc realpath readlink -->

- [Bash shell](#bash-shell)
  - [Shell options](#shell-options)
    - [Alias expansion](#alias-expansion)
  - [Fail and exit script on error](#fail-and-exit-script-on-error)
  - [Brace expansion](#brace-expansion)
    - [Moving/renaming a file](#movingrenaming-a-file)
  - [Overwrite (clobber) file with redirected output](#overwrite-clobber-file-with-redirected-output)
  - [shebang](#shebang)
  - [dot command](#dot-command)
  - [backslash escaped characters in single-character strings](#backslash-escaped-characters-in-single-character-strings)
  - [list shell variables](#list-shell-variables)
  - [Globbing](#globbing)
  - [Sourcing multiple files](#sourcing-multiple-files)
  - [Angle brackets (`<`)](#angle-brackets-)
    - [here string `<<<`](#here-string-)
    - [here document `<<`](#here-document-)
    - [redirect to stdin `<`](#redirect-to-stdin-)
  - [Argument parsing](#argument-parsing)
  - [input/output redirection](#inputoutput-redirection)
    - [Process lines in a file](#process-lines-in-a-file)
  - [Get the path of the currently executing function or script](#get-the-path-of-the-currently-executing-function-or-script)
  - [arrays](#arrays)
    - [print all array items](#print-all-array-items)
    - [array length](#array-length)
    - [input parameters](#input-parameters)
      - [array length](#array-length-1)
  - [`bind`](#bind)
    - [quoted insert](#quoted-insert)
  - [Check for existence of files/directories](#check-for-existence-of-filesdirectories)

## Shell options

`set`

- part of the [[POSIX]] standard
- modifies `$SHELLOPTS` env var

`shopt`

- Bash-specific
- modifies the `$BASHOPTS` env var

```bash
# list options and their status
set -o
shopt

# enable option
set -o OPTION
shopt -s OPTION

# disable option
set +o OPTION
shopt -u OPTION
```

### Alias expansion

```bash
shopt -s expand_aliases
```

## Fail and exit script on error

Add the line

```bash
set -euo pipefail
```

## Brace expansion

_see_: <https://www.howtogeek.com/725657/how-to-use-brace-expansion-in-linuxs-bash-shell/>

### Moving/renaming a file

Change file `foo.txt` to `bar.txt`

```bash
mv {foo,bar}.txt
```

Move file `./bar/foo.txt` to `./baz/`

```bash
mv ./{bar,baz}/foo.txt
```

## Overwrite (clobber) file with redirected output

If noclobber is set (`set -o noclobber`), then the redirect operator (`>`) will not work, and you must use the clobber
operator (`>|`).

```bash
$COMMAND_OUTPUT >| existing_file
```

## shebang

`#!/usr/bin/env bash`

Uses the `env` utility to find the bash specified in `$PATH`

## dot command

The dot command `.` is used to evaluate commands in the current execution context.

The `source` command is an alias for `dot`.

## backslash escaped characters in single-character strings

Use the dollar sign and single quotes to specify a backslash escaped character - useful in specifying the separator in
calls to `sort` and `column`, for example

e.g. `\t` for tab

_source:_ <https://www.gnu.org/savannah-checkoutes/gnu/bash/manual/bash.html#ANSI_002dC-Quoting>

## list shell variables

```bash
declare -p
```

## Globbing

- `*` - match all (excluding dot files)
- `.*` - match against dot files
  - `.[^.]*` or `.??*` to exclude `.` and `..` directories
- `?` - match a single character
- `'<TEXT>'` - prevents globbing

```bash
# match all
*

# ends with 'xy'
xy*

# starts with 'xy'
*xy

# contains 'xy'
*xy*

# would match 'xyz', but not 'wxyz'
?yz

# prints '*'
echo '*'
```

## Sourcing multiple files

```bash
 for f in <DIRECTORY>; do source $f; done
```

_source:_ <https://stackoverflow.com/a/1423444>

## Angle brackets (`<`)

### here string `<<<`

Passes single line into command

```bash
$ cat <<< 'hi there'
hi there
```

### here document `<<`

Passes document/multiple lines into command

```bash
$ cat <<EOF
> hi
> there
> EOF
hi
there
```

### redirect to stdin `<`

Passes file to commands standard input

<!-- cspell:disable -->

```bash
$ cat < /etc/fstab
/dev/sda2               /boot   ext4            nosuid,noexec,nodev,rw,noatime,nodiratime       0 2
/dev/sda4               /       ext4            rw,noatime,nodiratime,  0 1
/dev/sdb5               /var    ext4            nosuid,noexec,nodev,rw,relatime 0 2
--snip--
```

<!-- cspell:enable -->

_source_: <https://unix.stackexchange.com/a/80368>

## Argument parsing

Use the built-in bash `getopts` or the GNU `getopt` utility to parse command-line options

## input/output redirection

```bash
# redirect stdout to FILE
> FILE # or `1> FILE`

# append stdout to FILE
>> FILE

# pull FILE into stdin
< FILE

# redirect stderror
2> FILE

# redirect stdout and stderror
&> FILE

# append stdout and stderror
&>> FILE
```

### Process lines in a file

```bash
while read -r line; do
    cat $line
done <FILENAME
```

## Get the path of the currently executing function or script

```bash
# source: https://stackoverflow.com/a/1482133
dir_path=$(dirname -- "$(readlink -f -- "$0")")

# alternate method
# http://mywiki.wooledge.org/BashFAQ/028
dir_path=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
```

## arrays

### print all array items

`"${arr[@]}"` - expands each element as a separate argument

`"${arr[*]}` - merges args into a single argument

### array length

`"${#arr[@]}"`

### input parameters

`$@` for all parameters

`$1` for first parameter, `$2` for second parameter, etc.

#### array length

`"$#"`

## `bind`

Default keybindings configuration is located at `/etc/inputrc`

`Ctrl` can be represented as `\C-` or `^`

`Esc` can be `\e` or `^[`

```bash
# list default bindings
bind -P

# list bindable functions
bind -l
bind -P # also list their current bindings

# list variables and their values
bind -V
bind -v # list as commands to bind

# bind keys to FUNCTION
bind "KEY_SEQUENCE":FUNCTION

# unbind all keys bound to FUNCTION
bind -u FUNCTION

# set key bindings from FILE
bind -f FILE

# bind COMMAND to KEY_SEQUENCE
bind -x '"KEY_SEQUENCE"':COMMAND
bind -X # list sequences bound by `bind -x`
```

### quoted insert

To get the keycode representation for a key combination, enter `C-v` ("quoted insert") followed by the key combo to see it.

For example, typing `Ctrl+v Alt+l` will output `^[l`

## Check for existence of files/directories

```bash
test -f "$FILE" && echo "File exists"
test ! -f "$FILE" && echo "File does not exist"

test -d "$DIR" && echo "Directory exists"
test ! -d "$DIR" && echo "Directory does not exist"
```

## Check if variable is set

To test in scripts containing `set -o` (which will exit if referencing an unset variable):

```bash
if [[ "${FOO:-}" ]]; then
  echo "FOO is set"
fi
```
