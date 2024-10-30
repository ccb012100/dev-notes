# ShellCheck

<https://github.com/koalaman/shellcheck>

## disable rule(s) in a file

```sh
#!/bin/sh
# shellcheck disable=SC2059
```

The directive(s) must be on the first line after the shebang (white space and comments between the shebang and directive are allowed in versions `0.4.6`+)
