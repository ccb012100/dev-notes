# Git Bash for Windows

## Error: `standard out is not a tty`

### Solution

Append `.exe` to the binary name, _e.g._ `node` -> `node.exe`

## Calling [[cmd.exe]] from Git Bash

```bash
# `//c` is necessary to stop MSYS from transforming `/c` to `C:`
# make sure to wrap the command passed to CMD inside double quotes
cmd //c "COMMAND"
```
