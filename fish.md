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

## functions

Functions are auto-loaded from the `$HOME/.config/fish/functions/` directory. Fish loads them when they are first used;
it does this by looking for a file with the same name as the function (i.e. function `foobar` must be contained in
`foobar.fish`), so functions _must be contained in files of the same name_ if you want to make use of this functionality.
