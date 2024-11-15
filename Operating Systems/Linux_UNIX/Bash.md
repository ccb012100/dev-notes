# Bash shell

## Conditional expressions

[GNU Bash manual](https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions)

### booleans

True booleans don't exist in `bash`

`true` runs a command that is just `return 0`; Similarly, `false` is `return 1`

```bash
foo=true  

if [[ "$foo" == "true" ]]; then echo "this will run"; fi
if [[ "$foo" == true ]]; then echo "this will run"; fi
if [[ "$foo" -eq 1 ]]; then echo "this will run"; fi
if [[ "$foo" -ne 0 ]]; then echo "this will run"; fi
```

### strings

```bash
-z $foo  # true if length of $foo is 0

-n $foo  # true if length of $foo is non-zero

# true if strings are equal; performs pattern matching when used within [[ command
$foo == $bar
$foo = $bar

$foo != $bar  # true if strings are not equal

$foo < $bar # true if $foo lexographically sorts before $bar
$foo > $bar # true if $foo lexographically sorts after $bar
```

### arithmetic binary operators

- `eq`
- `ne`
- `lt`
- `gt`
- `ge`

Evaluated as arithemetic expressions when used with `[[` command.

### Check existence of files/directories

```bash
test -f "$FILE" && echo "File exists"
test ! -f "$FILE" && echo "File does not exist"

test -d "$DIR" && echo "Directory exists"
test ! -d "$DIR" && echo "Directory does not exist"
```

### Check if variable is set

To test in scripts containing `set -o` (which will exit if referencing an unset variable):

```bash
if [[ "${FOO:-}" ]]; then
  echo "FOO is set"
fi
```

### Check if variable is an integer

([source](https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash))

#### Unsigned integer

```bash
case ${foo#[-+]} in
  ''|*[!0-9]*)
    echo '$foo is an integer'
  ;;
esac;

# or using regex (much slower than case): 
[[ $foo =~ ^[0-9]+$ ]] && '$foo is an integer'
```

#### Signed integer

```bash
[[ $foo == ?(-)+([0-9]) ]] && echo "$foo is an integer"

# or using a POSIX character class:
[[ $foo == ?(-)+([[:digit:]]) ]] && echo "$foo is an integer"
```

## arrays

### print all array items

`${arr[@]}` - expands each element as a separate argument

`${arr[*]}` - merges args into a single argument

### array length

`${#arr[@]}`

### array slice

`${arr[@]:2} # all but first element`

### input parameters (args)

`"$@"` for all parameters

`$1` for first parameter, `$2` for second parameter, etc.

#### args array length

`"$#"`

#### args slice

```bash
${@:2}      # all but first arg

${@: -1}    # last arg (space between : and - is required)
${@:$#}     # last arg

${@: -2:1}  # next to last
```

## Shell options

`set`

- part of the POSIX standard
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

## Shell parameter expansion

| parameter | `foo` is unset | `foo` is null | `foo` is set |
| - | - | - | - |
| `${foo:-bar}`         | `$bar` | `$bar` | `$foo` |
| `${foo-bar}`          | `$bar` | `$bar` | `$foo` |
| `${foo:=bar}`         | sets `foo` to `$bar` | `foo=$bar` | `$foo` |
| `${foo:?bar}`         | prints `$bar` to stderr | prints `$bar` to stderr | `$foo` |
| `${foo:?val is null}` | prints `val is null` to stderr; exits non-interactive shell | prints `val is null` to stderr; exits non-interactive shell | `$foo` |
| `${foo:?val is null}` | prints `val is null` to stderr | prints `val is null` to stderr | `$foo` |
| `${foo:+bar}`         | _nothing_ | _nothing_ | `$bar` |
| `${foo:+val is null}` | _nothing_ | _nothing_ | `val is null` |

### Strip prefix/suffix

```bash
$ x="foobar"
$ echo "${x#foo}"
foo
$ echo "${x%bar}"
bar
# using variables for prefix/suffix
$ prefix="foo"
$ suffix="bar"
$ echo "${x#"$prefix"}"
foo
$ echo "${x%\"$suffix\"}"
bar
```

([source](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html))

## Moving/renaming a file

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

([source](https://www.gnu.org/savannah-checkoutes/gnu/bash/manual/bash.html#ANSI_002dC-Quoting))

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

([source](https://stackoverflow.com/a/1423444))

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

([source](https://unix.stackexchange.com/a/80368))

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
# source: <https://stackoverflow.com/a/1482133>
dir_path=$(dirname -- "$(readlink -f -- "$0")")

# alternate method
# http://mywiki.wooledge.org/BashFAQ/028
dir_path=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
```

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
bind -p # Display function names and bindings in bind command format

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

## `echo` without newline at the end

`echo -n FOO`

## testing/determing the destination of outputs

### terminal

`-t fd` is true if file descriptor (`fd`) is open and refers to a terminal

- `-t 0` stdin
- `-t 1` stdout
- `-t 2` stderr
