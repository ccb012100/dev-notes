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
