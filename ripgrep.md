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
rg -i $PATTERN

rg --ignore-case $PATTERN
```
