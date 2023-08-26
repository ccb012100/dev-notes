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

_source:_ <https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#ANSI_002dC-Quoting>

## list shell variables

```bash
declare -p
```

## Globbing

- `*` - match all
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
