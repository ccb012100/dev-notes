# Bash shell

- [Bash shell](#bash-shell)
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
  - [Get the path of the currently executing function or script](#get-the-path-of-the-currently-executing-function-or-script)
  - [arrays](#arrays)
    - [print all array items](#print-all-array-items)
    - [array length](#array-length)
    - [input parameters](#input-parameters)
      - [array length](#array-length-1)

## Fail and exit script on error

Add the line

```bash
set -euxo pipefail
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

```bash
$ cat < /etc/fstab
/dev/sda2               /boot   ext4            nosuid,noexec,nodev,rw,noatime,nodiratime       0 2
/dev/sda4               /       ext4            rw,noatime,nodiratime,  0 1
/dev/sdb5               /var    ext4            nosuid,noexec,nodev,rw,relatime 0 2
--snip--
```

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

`${BASH_SOURCE[0]}`

_source_: [BashFAQ](http://mywiki.wooledge.org/BashFAQ/028)

## arrays

### print all array items

`"${arr[@]}"` - expands each element as a separate argument

`"${arr[*]}` - merges args into a single argument

### array length

`"${#arr[@]}"`

### input parameters

`$@` for all parameters

`$1` for first parameter, `$2` for second paramter, etc.

#### array length

`"$#"`
