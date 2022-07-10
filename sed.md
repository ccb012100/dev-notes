# sed

Stream editor

## Find and replace text in files

using [[ripgrep]]

```bash
# find files containing 'foo' and replace 'foo' with 'bar'
rg foo --files-with-matches | xargs sed -i 's/foo/bar/g'
```

### [[Git Bash]] on [[Windows]]

Add the `ripgrep` flag `--path-separator //` to feed the filenames to `sed` in the format it expects, e.g.

```bash
rg --path-separator // foo --files-with-matches | xargs sed -i 's/foo/bar/g'
```

_source_: <https://github.com/BurntSushi/ripgrep/blob/master/FAQ.md#search-and-replace>

## Print by line number from file

```bash
# print line 512 from file
sed -n '512p' $FILE_NAME

# print lines 512-550
sed -n '512-550p' $FILE_NAME

# print line 512 plus 10 lines after X
sed -n '512,+10p' $FILE_NAME

# print lines 1, 5, and 7
sed -n '1p; 5p; 7p' $FILE_NAME
```
