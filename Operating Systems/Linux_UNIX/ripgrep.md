# ripgrep

Rust replacement for grep

<https://github.com/BurntSushi/ripgrep>

## Find files with text matching PATTERN

```bash
rg PATTERN

# list file names
rg -l PATTERN # --files-with-matches

# show <num> lines of context
rg -C<num> PATTERN # --after-context
rg -B <num> PATTERN # --before-context
rg -C <num> PATTERN # --context

# ignore case
rg -i PATTERN # --ignore-case

# literal (verbatim) search (disables regex)
rg -F PATTERN # --fixed-strings

# search by filetype
rg -t<filetype> PATTERN # --type

# invert match (i.e. non-matches)
rg -v PATTERN # --invert-match

# file/directory globbing
rg -g'<glob>' # --glob

# case insensitive globbing
rg --glob-case-insensitive '<glob>'

# inverse glob
rg -g'!<glob>' # --globl

# show file names only
rg -l PATTERN # --files-with-matches

# show file names - inverse match
rg --files-without-match PATTERN

# show number of matching lines per file
rg -c PATTERN # --count

# show number of matches per file
rg --count-matches PATTERN

# show total number of matches across all files
rg -o PATTERN | wc -l

# search for pattern in given file
rg -f<file> PATTERN # --file

# include hidden files in search
rg --hidden PATTERN

# include 0 matches
rg [--count|--count-matches] --include-zero PATTERN

# search for pattern that starts with a dash
rg -e PATTERN # e.g. `man rg | rg -e -F` to search for entry on -F flag

# don't print lines over length <num>
rg [-M|--max-colums]<num> PATTERN

# no max line length
rg -M0 PATTERN

# Don't respect ignore files
# Equivalent to `grep -r`
rg -uuu # same as --no-ignore --hidden --binary

# only show <num> matches
rg -m<num> PATTERN

# only print the matching portion of a line (useful in conjunction with capture groups)
rg -o PATTERN
```
