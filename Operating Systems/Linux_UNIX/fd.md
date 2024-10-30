# fd

`find` alternative

<https://github.com/sharkdp/fd>

```bash
# find by regex
fd PATTERN

# match on multiple patterns (must match on all)
fd PATTERN --and PATTERN_2

# find by exact string
fd --fixed-strings PATTERN

# find by glob
fd --glob PATTERN

# case-sensitive search (default is smart casing)
fd --case-sensitive PATTERN

# find files by extension (can be used multiple times to search for multiple types)
fd --extension EXTENSION

# include hidden and ignored files
fd --hidden --no-ignore PATTERN
fd --unrestricted # alias for `--hidden --no-ignore`

# execute command on each match (think: xargs)
fd PATTERN --exec COMMAND

# execute command once, with all matches as arguments 
fd PATTERN --exec-batch COMMAND

# batch matches and execute command on each batch
fd PATTERN --exec-batch COMMAND --batch-size

# specify a template string that is used for printing a line for each match
fd --format FMT
```

## Filter by type

`fd -t FILETYPE` or `fd --type FILETYPE`

```bash
# Only search for files
fd --type file
fd -tf

# Find both files and symlinks
fd --type file --type symlink
fd -tf -tl

# Find executable files
fd --type executable
fd -tx

# Find empty files
fd --type empty --type file
fd -te -tf

# Find empty directories
fd --type empty --type directory
fd -te -td
```

### file types

- `f`, `file`
  - regular files
- `d`, `dir`, `directory`
  - directories
- `l`, `symlink`
  -  symbolic links
- `b`, `block-device`
  - block devices
- `c`, `char`-device
  - character devices
- `s`, `socket`
  - sockets
- `p`, `pipe`
  - named pipes (FIFOs)
- `x`, `executable`
  - executable files
    - implies `-type file` by default
- `e`, `empty`
  - empty files or directories
    - searches for both unless `--type file` or `-type directory` is specified

## Get line counts of files

```bash
# find all *.cs files, sort by line count descending
fd --hidden --extension cs | xargs wc -l | sort --reverse
```
