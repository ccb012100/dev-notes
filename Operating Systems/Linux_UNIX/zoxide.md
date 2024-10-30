# `zoxide`

<https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file>

## Subcommands

`z` is the default command, but I have it changed to `j`.

For aliases and scripts, it's better to use `__zoxide_z` and `__zoxide_zi`.

``````bash
j FOO               # cd into highest ranked directory matching FOO
j FOO BAR           # cd into highest ranked directory matching FOO and BAR
j FOO /             # cd into a subdirectory starting with FOO

j ~/FOO             # z also works like a regular cd command
j FOO/              # cd into relative path
j ..                # cd one level up
j -                 # cd into previous directory
j

ji FOO              # cd with interactive selection (using fzf)

j FOO<SPACE><TAB>   # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)

zoxide edit         # delete/increment/decrement entries

zoxide query FOO    # Search for a directory in the database.

zoxide add FOO      # Add a new directory to the database, or increment its rank.

zoxide remove FOO   # Remove a directory from the database.
```
