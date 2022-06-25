# ripgrep

<https://github.com/BurntSushi/ripgrep>

## Find files with text matching $PATTERN

```bash
rg $PATTERN

# list file names
rg -l $PATTERN # --files-with-matches

# show $NUM surrounding lines on either side of match
rg -C $NUM $PATTERN # --context

# ignore case
rg -i $PATTERN # --ignore-case

# literal search (disable regex)
rg -F '$PATTERN' # --fixed-strings

# find C# files containing "System"
rg -t $FILETYPE $PATTERN # --type

# invert match (i.e. non-matches)
rg -v $PATTERN # --invert-match

# file/directory globbing
rg -g '$GLOB' # --glob

# case insensitive globbing
rg --glob-case-insensitive '$GLOB'

# inverse glob
rg -g '!$GLOB' $PATTERN # --globl

# show file names only
rg -l $PATTERN # --files-with-matches

# show file names - inverse match
rg --files-without-match $PATTERN

# show number of matching lines per file
rg -c $PATTERN # --count

# show number of matches per file
rg --count-matches $PATTERN

# search for pattern from given file
rg -f $FILE $PATTERN # --file

# include hidden files in search
rg --hidden $PATTERN

# include 0 matches
rg [--count|--count-matches] --include-zero $PATTERN
```
