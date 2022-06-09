# ln

Link files

```bash
# hard link
ln file /target/dir/

# create a link with a different filename than target
ln file /target/dir/new_file

# symbolic link (aka 'soft link' or 'symlink')
ln -s file /target/dir/new_file

# prompt user if file exists
ln -i file /target/dir/new_file

# replace link if it already exists
ln -f file /target/dir/new_file

# link multiple file
ln /dir/{file1,file2,foo,bar} /target/dir
```
