# Linux rsync

file transfer utility

## Flags

A good default is `rsync -Puva`

- `-P` -> Show progress per file
- `-u` -> Skip updating target files if they are newer than the source
- `-v` -> Verbose: show progress overall, outputting information about each file as it completes it
- `-a` -> Archive

  - Using this flag, `rsync` will sync the contents recursively while preserving any symbolic, special/device files, modification times, file permissions, group, owner, etc. It’s more commonly used than the `-r` flag. For archival, this is a more recommended method.
  - Equivalent to `-Dgloprt`
    - `-D` Copy device files
    - `-g` Preserve group ownership
    - `-l` Copy symlinks as new symlinks
    - `-o` Preserve user ownership (which is restricted to only superusers when dealing with other user’s files)
    - `-p` Preserve permissions
    - `-r` Recurse through directories (as opposed to only working on files in the current directory)
    - `-t` Preserve modification times

### Dry run flags

- `-n` -> Dry run the command without transferring files
- `--list-only` -> Only show the list of files that `rsync` would transfer

## Copy directory contents instead of directory

`/` after the name of the directory tells `rsync` that the source is all the contents of the source directory. If the `/` at the end of the source directory isn’t used, `rsync` will simply create a copy of the source directory instead of its contents.
