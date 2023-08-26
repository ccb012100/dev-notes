# Bash shell

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
