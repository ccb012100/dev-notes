# fzf

command-line fuzzy finder

<https://github.com/junegunn/fzf>

## Search syntax

(Copied from `fzf`'s [README](https://github.com/junegunn/fzf/blob/master/README.md))

Unless otherwise specified, fzf starts in "extended-search mode" where you can
type in multiple search terms delimited by spaces. e.g. `^music .mp3$ sbtrkt !fire`

| Token     | Match type                 | Description                          |
| --------- | -------------------------- | ------------------------------------ |
| `sbtrkt`  | fuzzy-match                | Items that match `sbtrkt`            |
| `'wild`   | exact-match (quoted)       | Items that include `wild`            |
| `^music`  | prefix-exact-match         | Items that start with `music`        |
| `.mp3$`   | suffix-exact-match         | Items that end with `.mp3`           |
| `!fire`   | inverse-exact-match        | Items that do not include `fire`     |
| `!^music` | inverse-prefix-exact-match | Items that do not start with `music` |
| `!.mp3$`  | inverse-suffix-exact-match | Items that do not end with `.mp3`    |

If you don't prefer fuzzy matching and do not wish to "quote" every word,
start fzf with `-e` or `--exact` option. Note that when `--exact` is set,
`'`-prefix "unquotes" the term.

A single bar character term acts as an OR operator. For example, the following
query matches entries that start with `core` and end with either `go`, `rb`,
or `py`.

## Shortcuts

- `Ctrl+t` Search lines/directories
- `Ctrl+r` Search `history`
  - Press `Ctrl+r` again to toggle sorting by relevance
- `Alt+c` `cd` into the selected directory

## Fuzzy completion

_Note:_ _Not_ supported in [[fish]] shell.<>

_Note:_ I've changed the trigger sequence to `;;` (the default is `**`).

```bash
# Files under the current directory
# - You can select multiple items with TAB key
vim ;;<TAB>

# Files under parent directory
vim ../;;<TAB>

# Files under parent directory that match `fzf`
vim ../fzf;;<TAB>

# Files under your home directory
vim ~/;;<TAB>

# Directories under current directory (single-selection)
cd ;;<TAB>

# Directories under ~/github that match `fzf`
cd ~/github/fzf;;<TAB>

# Environment variables/Aliases
unset ;;<TAB>
export ;;<TAB>
unalias ;;<TAB>

# kill processes
# Can select multiple processes with <TAB> or <Shift-TAB> keys
kill -9 <TAB>

# ssh
ssh ;;<TAB>
```
