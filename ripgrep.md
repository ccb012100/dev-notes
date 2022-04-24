# ripgrep

<https://github.com/BurntSushi/ripgrep>

## Find files with text matching $PATTERN

```bash
rg $PATTERN

# list file names
rg --files-with-matches $PATTERN
rg -l $PATTERN

# show $NUM surrounding lines on either side of match
rg --context $NUM $PATTERN
rg -C $NUM $PATTERN

# ignore case
rg --ignore-case $PATTERN
rg -i $PATTERN

# literal search (disable regex)
rg --fixed-strings '$PATTERN'
rg -F '$PATTERN'

# find C# files containing "System"
rg --type $FILETYPE $PATTERN
rg -t $FILETYPE $PATTERN

# invert match (i.e. non-matches)
rg --invert-match $PATTERN
rg -v $PATTERN

# file/directory globbing
rg --glob '$GLOB'
rg -g '$GLOB'

# case insensitive globbing
rg --glob-case-insensitive '$GLOB'

# inverse glob
rg --glob '$GLOB' $PATTERN
rg -g '!$GLOB' $PATTERN

# show file names only
rg --files-with-matches $PATTERN
rg -l $PATTERN

# show file names - inverse match
rg --files-without-match $PATTERN

# show number of matching lines per file
rg --count $PATTERN
rg -c $PATTERN

# show number of matches per file
rg --count-matches $PATTERN

# search for pattern from given file
rg --file $FILE $PATTERN
rg -f $FILE $PATTERN

# include hidden files in search
rg --hidden $PATTERN

# include 0 matches
rg [--count|--count-matches] --include-zero $PATTERN
```
