# broot

Linux directory naviagation tool

Repository: <https://github.com/Canop/broot>

Documentation: <https://dystroy.org/broot/>

`br` command

## flags

- `-s`, `--sizes` Show file sizes
- `-f`, `--only-folders` Only show folders
- Sorting
  - `--sort-by-count` (only one level of the tree)
  - `--sort-by-date` (only one level of the tree)
  - `--sort-by-size` (only one level of the tree)
  - `-w`, `--whale-spotting` Sort by size, show hidden and ignored files
- `-p`, `--permissions` Show permissions
- Git
  - `-g`, `--show-git-info`
  - `--git-status`

## Keybindings

- `:gf` Display git status of files
- `:gs` Show files in Git stating area (i.e. result of `git status`)
- `:fs` Check the usage of all filesystems
- `:quit`, `<CTRL>+q` Quit to terminal
- `<SPACE>h<ENTER>` Show hidden files
- `<TAB>` Select next match
- `<ALT>+h` Toggle visibility of hidden files
- `<ALT>+i` Toggle visbility of gitignored files
- `d<ENTER>` Show dates
- `sd<ENTER>` Sort by date

## Search

See <https://dystroy.org/broot/input/#the-filtering-pattern> for search syntax

Type `c/$PATTERN` to search file contents

### Pattern composition

`|` (or), `&` (and), `!` (not), `()` (parenthese)

example: to see files those name do _not_ end in `md` and contain the text `Option<Option`:

`!/md$/&c/Option</Option`

### Use regular expression

Prepend search with a forward slash (`/`) to use a regex, i.e. `/$PATTERN`

## Operating on a selected files

- `<ENTER>` Open in the system's default program
- `<ALT>+<ENTER>` Open in the system's default program and close broot
- `<CTRL>+<RightArrow>` Preview the file
  - `<CTRL>+<RightArrow>` again to go inside the preview
  - `<CTRL>+<LeftArrow>` Close preview
- Type a verb
  - For example `:e` opens the file in the preferred editor

## Operating on selected directories

- `<ALT>+<ENTER>` `cd` to the selected directory and exit broot
- `<CTRL>+<RightArrow>` Open another panel
  - `<CTRL>+<RightArrow>`, `<CTRL>+<LeftArrow>` Navigate between panels
