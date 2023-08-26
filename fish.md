# fish shell

<https://fishshell.com/docs/current/>

## `bind`

fish equivalent to `bindkey`

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

```bash
$ echo '#!/usr/bin/env fish
echo "$argv[2..-1]"' >> script.fish
$ ./script foo bar bat baz
bar bat baz
```

### test argv count

```sh
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

## abbreviations

Abbreviations are similar to aliases, but are expanded after pressing `Space` or `Enter`. Using `Control+Space` to avoid
expanding.

```sh
abbr --add <NAME> <EXPANSION>
```
