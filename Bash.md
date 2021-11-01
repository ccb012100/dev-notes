# Bash shell

## Brace expansion

_see_: <https://www.howtogeek.com/725657/how-to-use-brace-expansion-in-linuxs-bash-shell/>

### Moving/renaming a file

Change file `foo.txt` to `bar.txt`

```bash
mv {foo,bar}.txt
```

Move file `./bar/foo.txt` to `./baz/`

```bash
mv ./{bar,baz}/foo.txt
```
