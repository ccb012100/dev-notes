# mkdir

[[Linux]] utility to make directories

```bash
# make directory 'foobar'
mkdir foobar

# make directory 'foobar' with file mode 700
mkdir -m 700 foobar

# make directory 'foo/bar/bat/baz' and create any non-existent intermediate directories as necessary
mkdir -p foo/bar/bat/baz
```

## Create directory and intermediate directories

Use the `-p` flag to create a directory and any intermediate directories that don't already exist.
