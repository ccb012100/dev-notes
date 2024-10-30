# Emacs

## load without user config

```bash
emacs -q
emacs --no-init-file

# equivalent to 'emacs -q --no-site-file --no-splash
emacs --quick 
emacs -Q
```

## digit-argument

`C-<number_key>` calls the command `digit-argument`, which can be used to give numeric arguments to a command.

Ex. `C-5 C-n` will move down 5 lines (it becomes `C-u 5 C-n`, which is equivalent to calling `M-x eval-expression
(next-line 5)`)

## package-install

`M-x package-refresh-contents`

## package list

`M-x list-packages`

`i`

- Mark the package on the current line for installation (package-menu-mark-install). If the package status is
‘available’, this adds an ‘I’ character to the start of the line; typing x (see below) will download and install the
package.

`d`

- Mark the package on the current line for deletion (package-menu-mark-delete). If the package status is ‘installed’,
this adds a ‘D’ character to the start of the line; typing x (see below) will delete the package.

`u` or `<DEL>`

- Remove any installation or deletion mark previously added to the current line by an i or d command.

`U`

- Mark all package with a newer available version for upgrading (package-menu-mark-upgrades). This places an
installation mark on the new available versions, and a deletion mark on the old installed versions.

`x`

- Download and install all packages marked with i, and their dependencies; also, delete all packages marked with d
(package-menu-execute). This also removes the marks.

`r`

- Refresh the package list (package-menu-refresh). This fetches the list of available packages from the package archive
again, and recomputes the package list.

`f`

- Filter the package list (package-menu-filter). This prompts for a keyword (e.g., ‘games’), then shows only the
packages that relate to that keyword. To restore the full package list, type q.

## Key bindings

**NOTE** C-c key commands are all undefined and reserved for user mapping

```txt
C-h b                   list all shortcuts
C-i                     TAB
C-left/right arrow      move next/previous word
C-u M-x align           align text by column
C-up/down arrow         next/previous paragraph
C-x -                   fit window to buffer content
C-x C-b                 list buffers
C-x C-f                 find-file [i.e. open file]
C-x C-h                 list shortcuts with prefix C-x
C-x C-o                 delete empty lines
C-x d                   same as M-x dired
C-x h                   mark whole buffer
C-x r i R               insert the contents of register R
C-x r s R               save region (selection) into register R
C-x z                   repeat last command
M-/                     autocomplete word
M-;                     insert comment delimiter
M-@                     select current word
M-SPC                   leave single space between words (cursor must be placed in whitespace)
M-^                     join line with previous line
M-a                     backward sentence
M-c                     capitalize following word
M-e                     forward sentence
M-g g                   go to line
M-l                     convert word to lower case
M-m                     move to first non-whitespace char in line
M-t                     transpose words
M-u                     convert word to upper case
M-w                     select region
M-x align-regexp
M-x artist-mode         artist-mode
M-x flush-lines         delete lines that match a regexp
M-x ielm                e-lisp REPL
M-x picture-mode        picture-mode
M-x re-builder          interactive regexp builder
M-x term                terminal (want M-x ansi-term)
M-y                     cycle through kill ring (only works directly after C-y)
M-z                     zap to character
```

## Highlighting by Word, Line and Regexp

`M-s h l` - highlight-lines-matching-regexp Highlights all lines matching a regular expression

`M-s h p` - highlight-phrase Highlights everything matching a phrase

`M-s h r` - highlight-regexp Highlights everything matching a regular expression

`M-s h u` - unhighlight-regexp Deletes the highlighter under point

`M-s h w` - hi-lock-write-interactive-patterns Inserts a list of Hi-Lock patterns into the buffer

`M-s h f` - hi-lock-find-patterns Searches for Hi-Lock patterns in the buffer to use.

## Sorting

set `sort-fold-case` to `t` to ignore case when sorting

## Macros

Name macro

```emacs
C-x (
```

End macro

```emacs
C-x )
```

Name macro

```emacs
M-x name-last-kbd-macro
```

Insert macro into `.emacs`

```emacs
M-x insert-kbd-macro
```

Let Emacs know `macro-name` is a macro

```emacs
(put 'macro-name 'kmacro t)
```

## Auto-indent

```emacs
(define-key global-map (kbd "RET") 'newline-and-indent)
```

## Dired

`d` - mark file for deletion

`C` - copy/move file

`g` - refresh

`h` - info

`j` - go to file

`m` - mark for later command

`R` - rename file

`s` - toggle sorting by name/date

`u` - unmark file

`x` - delete files marked for deletion

## Enable mouse in terminal

```emacs
M-x xterm-mouse-mode
```

## Start server daemon at Ubuntu startup

- Add the following to `~/.config/systemd/user/emacsd.service`:

```ini
[Unit]
Description=Emacs: the extensible, self-documenting text editor
Documentation=man:emacs(1) info:Emacs


[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval "(progn (setq kill-emacs-hook nil) (kill-emacs))"
Restart=on-failure
Environment=DISPLAY=:%i
TimeoutStartSec=0

[Install]
WantedBy=default.target
```

- Run `systemctl --user enable emacsd`

_([source](https://wikemacs.org/wiki/Emacs_server))_
