# `zoxide`

<https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file>

## Commands

`z` is the default command, but I have it changed to `j`.

For aliases and scripts, it's better to use `__zoxide_z` and `__zoxide_zi`.

``````bash
j foo              # cd into highest ranked directory matching foo
j foo bar          # cd into highest ranked directory matching foo and bar
j foo /            # cd into a subdirectory starting with foo

j ~/foo            # z also works like a regular cd command
j foo/             # cd into relative path
j ..               # cd one level up
j -                # cd into previous directory
j

ji foo             # cd with interactive selection (using fzf)

j foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)

zoxide edit        # delete/increment/decrement entries
```
