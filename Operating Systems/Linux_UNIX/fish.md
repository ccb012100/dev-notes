# fish shell

<https://fishshell.com/docs/current/>

## `set`

display and change shell variables

```fish
# print all global, exported variabls
set -gx

# set $FOO to bar
set FOO bar

# append baz to $FOO variable
set -a FOO baz
```

## shortcuts

- `<A-p>` - pipe command to `less`
- `<C-g>` - pipe command to `less`
- `<C-;>` - pipe command to `less`
- `<A-r>` - pipe command to `less`

## here docs/here strings

Not supported by fish: <https://fishshell.com/docs/current/fish_for_bash_users.html#heredocs>

## script arguments

### list of arguments

`$argv`

### access single argument

`$argv[1]`

### access range of args

`$argv[2..-1]`

#### example

```fish
$ echo '#!/usr/bin/env fish
echo "$argv[2..-1]"' >> script.fish
$ ./script foo bar bat baz
bar bat baz
```

### test argv count

```fish
if test (count $argv) -gt 0
    ---snip---
end
```

## functions

### loading

Functions are auto-loaded from the `$HOME/.config/fish/functions/` directory. Fish loads them when they are first used;
it does this by looking for a file with the same name as the function (i.e. function `foobar` must be contained in
`foobar.fish`), so functions _must be contained in files of the same name_ if you want to make use of this functionality.

### viewing

The command `functions` will list all functions. `functions <FUNC_NAME>` will show the details for a function.

## aliases

Aliases are just functions. `alias --save` will save the alias as a function in the autoloaded functions directory.

### see alias definition

To do the equivalent of `alias FOO` in Bash, use `function FOO` (works with functions as well, obviously).

## abbreviations

Abbreviations are similar to aliases, but are expanded after pressing `Space` or `Enter`. Using `Control+Space` to avoid
expanding.

```fish
abbr --add <NAME> <EXPANSION>
```

## Switch case

```fish
switch $argv[1]
    case cat
        echo evil
    case wolf dog human moose dolphin whale
        echo mammal
    case duck goose albatross
        echo bird
    case shark trout stingray
        echo fish
    # NOTE: default case must be surrounded in single-quotes
    case '*'
        echo I have no idea what a $animal is
end
```

## Print keyboard input codes

Use [`fish_key_reader`](https://fishshell.com/docs/current/cmds/fish_key_reader.html) to print the key codes for a key sequence.

## Get the directory a running script is located

```fish
dirname (status --current-filename)
```
