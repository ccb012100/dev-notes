# sed

Stream editor

- [USEFUL ONE-LINE SCRIPTS FOR SED (Unix stream editor)](https://www.pement.org/sed/sed1line.txt)
- [Chart of similar operations with sed and awk](https://www.pement.org/awk/awk_sed.txt)

## Find and replace text in files

Use `-i` or `--in-place` to edit a file in place

### using ripgrep

```bash
# find files containing 'foo' and replace 'foo' with 'bar'
rg foo --files-with-matches | xargs sed --in-place 's/foo/bar/g'
```

### Git Bash on Windows

Add the `ripgrep` flag `--path-separator //` to feed the filenames to `sed` in the format it expects, e.g.

```bash
rg --path-separator // foo --files-with-matches |
    xargs sed --in-place 's/foo/bar/g'
```

_source_: <https://github.com/BurntSushi/ripgrep/blob/master/FAQ.md#search-and-replace>

## Print lines that match a pattern

```bash
sed -n '/PATTERN/p'

sed '/PATTERN/!d'
```

## Print by line number from file

```bash
# print line 512 from file
sed -n '512p' FILE

# print lines 512-550
sed -n '512,550p' FILE

# print line 512 plus 10 lines after X
sed -n '512,+10p' FILE

# print lines 1, 5, and 7
sed -n '1p; 5p; 7p' FILE
```

## Delete lines in a file that match a pattern

```bash
# --in-place/-i edits the file in place
# d command = "delete pattern space"
sed --in-place '/PATTERN/d' FILE

# case-insensitive matching
## note: the I must be before the d
sed --in-place '/PATTERN/Id' FILE_NAME
```

## Trim whitespace from a file

```bash
sed -Ee 's/^[[:space:]]+([0-9]+)[[:space:]]+/\1,/' --in-place FILE
```
