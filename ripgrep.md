# ripgrep

[[Rust]] replacement for [[grep]]

<https://github.com/BurntSushi/ripgrep>

## Find files with text matching PATTERN

```bash
rg PATTERN

# list file names
rg -l PATTERN # --files-with-matches

# show $NUM lines of context
rg -C $NUM PATTERN # --after-context
rg -B $NUM PATTERN # --before-context
rg -C $NUM PATTERN # --context

# ignore case
rg -i PATTERN # --ignore-case

# literal (verbatim) search (disables regex)
rg -F 'PATTERN' # --fixed-strings

# find C# files containing "System"
rg -t $FILETYPE PATTERN # --type

# invert match (i.e. non-matches)
rg -v PATTERN # --invert-match

# file/directory globbing
rg -g '<GLOB>' # --glob

# case insensitive globbing
rg --glob-case-insensitive '<GLOB>'

# inverse glob
rg -g '!<GLOB>' PATTERN # --globl

# show file names only
rg -l PATTERN # --files-with-matches

# show file names - inverse match
rg --files-without-match PATTERN

# show number of matching lines per file
rg -c PATTERN # --count

# show number of matches per file
rg --count-matches PATTERN

# search for pattern from given file
rg -f $FILE PATTERN # --file

# include hidden files in search
rg --hidden PATTERN

# include 0 matches
rg [--count|--count-matches] --include-zero PATTERN

# search for pattern that starts with a dash
rg -e PATTERN # e.g. `man rg | rg -e -F` to search for entry on -F flag

# don't print lines over length NUM
rg [-M|--max-colums] NUM PATTERN

# no max line length
rg -M0 PATTERN
```
