# Vim

- [Vim](#vim)
  - [Exit](#exit)
  - [Save](#save)
    - [`ZZ` vs `:wq`](#zz-vs-wq)
  - [Normal mode](#normal-mode)
    - [Scroll screen, centered on cursor](#scroll-screen-centered-on-cursor)
    - [Format document](#format-document)
    - [Rewrap text](#rewrap-text)
    - [Macros](#macros)
      - [Record macro](#record-macro)
      - [Replay macro](#replay-macro)
      - [Replay last executed macro](#replay-last-executed-macro)
      - [View macros](#view-macros)
    - [Registers](#registers)
    - [`vimrc` file locations](#vimrc-file-locations)
    - [View keybindings](#view-keybindings)
    - [Searching](#searching)
      - [Ignore casing](#ignore-casing)
        - [To turn off globally:](#to-turn-off-globally)
        - [To turn on globally:](#to-turn-on-globally)
    - [Increment/decrement numbers](#incrementdecrement-numbers)
    - [Motion/Navigation](#motionnavigation)
      - [Go to line](#go-to-line)
      - [Go to column](#go-to-column)
    - [Windows](#windows)
      - [Split window](#split-window)
    - [Marks](#marks)
  - [Insert mode](#insert-mode)
    - [Entering Insert mode](#entering-insert-mode)
  - [Visual mode](#visual-mode)
    - [Enter visual mode](#enter-visual-mode)
    - [Exit visual mode](#exit-visual-mode)
    - [Manipulate text](#manipulate-text)
  - [runtimepath](#runtimepath)
    - [print runtimepath](#print-runtimepath)
  - [Reload `.vimrc`](#reload-vimrc)
  - [Comment/uncomment code](#commentuncomment-code)
  - [Get current filename](#get-current-filename)
  - [system clipboard](#system-clipboard)
    - [Copy all](#copy-all)
    - [Paste from clipboard](#paste-from-clipboard)
  - [troubleshoot startup](#troubleshoot-startup)
  - [switch between files](#switch-between-files)
  - [Plugin keybindings](#plugin-keybindings)
    - [EasyMotion](#easymotion)
    - [commentary.vim](#commentaryvim)

## Exit

```vim
:q    " exit if there are no unsaved changes (short for :quit)
:q!   " discard unsaved changes and exit
:qa   " exit all (short for :quitall)
:cq   " quit without saving and use nonzero exit code (short for :cquit)

ZQ    " same as :q!
```

## Save

```vim
:update " write file if buffer has been modified
:w      " write file
:wall   " write all changed buffers
:wall!  " write all buffers
:x      " write file if changes have been made, and then exit (short for :exit)
   
ZZ      " same as :x/:exit
```

### `ZZ` vs `:wq`

`:wq` will always write to the file and update the last modified time. `ZZ` will only write to the file if changes have been made.

## Normal mode

```vim
J             " join with next line
gJ            " join lines without inserting a space

gv            " reselect previous visual area

~             " change casing
gU{motion}    " convert text in direction moved to uppercase
gu{motion}    " convert text in direction moved to lowercase

y             " yank
yy            " copy line
Y             " copy line
zy            " yank without trailing spaces

p             " paste before
P             " paste after

dd            " delete line
D             " delete to EOL

u             " undo
CTRL-R        " redo

:g/regexp/d   " delete all lines that match regexp
:v/regexp/d   " delete all lines that do NOT match regexp

```

### Scroll screen, centered on cursor

```vim
z<CR>   " focus cursor on top
zt      " focus cursor on top
zb      " focus cursor on bottom
z-      " focus cursor on bottom
z.      " focus cursor in center
zz      " focus cursor in center

12z+    " focus cursor on line 12
```

### Format document

```vim
gg=G
```

### Rewrap text

`gq` followed by the range

Examples:

```vim
gqq  " wrap in current line
gqip " wrap in current paragraph
```

### Macros

Allowable register names for macros are the letters a-z

#### Record macro

```vim
q<register><commands>q
```

#### Replay macro

```vim
@<register>
```

#### Replay last executed macro

```vim
@@
```

#### View macros

```vim
:reg

:reg <register>
```

### Registers

`"{register}` will use `{register}` for the next delete, yank, or put.

<https://www.brianstorti.com/vim-registers/>

### `vimrc` file locations

Enter `:version` to see list of paths that vim checks for `vimrc` files.

### View keybindings

```vim
:help index
```

### Searching

Type `/`, then the search term, then `[Enter]`

```vim
/{search term}<ENTER> " search forwards
?{search term}<ENTER> " search backwards

n   " next match
N   " previous match
```

#### Ignore casing

Append `\c` to the search term to ignore the casing, or `\C` to match case

e.g. `/Linux\c` or `/Linux\C`

##### To turn off globally:

```vim
:set ignorecase

" or

:set ic
```

##### To turn on globally:

`:set noignorecase` or `:set noic`

### Increment/decrement numbers

- `C-a` -> increment next number
- `C-x` -> decrement next number

### Motion/Navigation

```vim
w   " move to beginning of next word
e   " move last letter of word

H   " Top of screen ('Highest')
M   " Middle of screen ('Middle')
L   " Bottom of screen ('Lowest')

(   " Beginning of sentence
)   " End of sentence
{   " Beginning of paragraph
}   " End of paragraph

gM  " go to character at middle of the text line
gm  " go to character at middle of the screenline

zj  " move to the start of the next fold
zk  " move to the start of the previous fold

0   " move to first character of the line
^   " move to first non-blank character of the line
$   " move to the end of the line

n   " next match
N   " previous match

*   " move to next occurrence of word under cursor
#   " move to previous occurrence of word under cursor

f{char} " move cursor on next {char}
F{char} " move cursor on next {char} backwards

t{char} " move cursor before next {char}
T{char} " move cursor after next {char} backwards

;       " repeat last [f|t|F|T] command
,       " repeat last [f|t|F|T] command in opposite direction
```

#### Go to line

using line 32 as an example:

```vim
32G         " G defaults to last line of file

32gg        " gg defaults to first line of file

:32<ENTER>
```

#### Go to column

Using line 32 as an example:

```vim
32|
```

### Windows

#### Split window

```vim
:sp file         " open a file in a new split window
:vs file         " open a file in a new vertical split window

CTRL-W q         " quit window
CTRL-W o         " quit all but current window

CTRL-W {motion}  " move to window in direction of motion
CTRL-W w         " go to next window
CTRL-W p         " go to previous window

CTRL-W +         " increase window height
CTRL-W -         " decrease window height
CTRL-W <         " decrease window width
CTRL-W >         " increase window width

CTRL-W H         " move current window to the far left
CTRL-W J         " move current window to the very bottom
CTRL-W K         " move current window to the very top
CTRL-W L         " move current window to the far right
```

### Marks

```vim
ma      " mark spot and label it a
mA      " mark spot and globally label it A

'a      " jump to mark
'A      " jump to mark (cross file)

''      " jump to previous spot
'.      " jump to last modification
:marks  " show all marks
```

## Insert mode

### Entering Insert mode

```vim
I   " insert at beginning of line
i   " insert before cursor

A   " append after end of line
a   " append after cursor

O   " open new line before cursor
o   " open new life after cursor

C   " synonym for c$ (change to end of line)
cc  " change line

r   " replace character
R   " enter overtype ('Replace') mode

gI  " insert at column 1
```

## Visual mode

### Enter visual mode

```vim
v       " Character mode
V       " Line mode
CTRL-v  " Block mode
gv      " Start visual mode with last selection
```

### Exit visual mode

`<Esc>`, `CTRL-C`, or the same key you used to enter visual mode

### Manipulate text

Commands act on the selection

```vim
<   " dedent
>   " indent
=   " auto-indent

c   " change
d   " delete

~   " change case
u   " lowercase
U   " uppercase

y   " yank
```

## runtimepath

The `runtimepath` is the list of directories where vim searches for runtime files.

### print runtimepath

```vim
:echo &rtp
```

## Reload `.vimrc`

```vim
" :so is short for :source
:so $MYVIMRC
:so ~/.vimrc

" % is the current file name, so you can also source current file
" if .vimrc is the file you're currently editing
:so %
```

## Comment/uncomment code

Use the plugin [tcomment](https://github.com/tomtom/tcomment_vim).

There's also [vim-commentary](https://github.com/tomtom/tcomment_vim)

## Get current filename

```vim
C-G   " print file name
1 C-G " print full path

" % register holds the current filename,
" relative to the current working directory 
:echo @%
```

## system clipboard

There are 2 clipboard registers:

- `*` -> PRIMARY (copy-on-select)
- `+` -> CLIPBOARD (ctrl+C/V)

### Copy all

```vim
" % register is the current file

" copy all to clipboard
:%y*    " or :%y+
```

### Paste from clipboard

`"*p` or `ctrl+shift+v`

## troubleshoot startup

`vim -V`

## switch between files

```vim
:n  " next file
:N  " previous file
```

## Plugin keybindings

### [EasyMotion](https://github.com/easymotion/vim-easymotion)

```vim
<leader> = <Space> or <Backspace>

<leader>; <Plug>(easymotion-s2)     " 2-char search
<leader>F <Plug>(easymotion-bd-F)   " move to char
<leader>f <Plug>(easymotion-bd-f)   " move to char
<leader>h <Plug>(easymotion-linebackward)
<leader>j <Plug>(easymotion-j)
<leader>k <Plug>(easymotion-k)
<leader>L <Plug>(easymotion-bd-jk)  " move to line
<leader>l <Plug>(easymotion-lineforward)
<leader>s <Plug>(easymotion-s2)     " 2-char search
<leader>W <Plug>(easymotion-w)      " word motion
<leader>w <Plug>(easymotion-bd-w)   " word motion
```

### [commentary.vim](https://github.com/tpope/vim-commentary)

`gcc`: (un)comment out a line (takes a count)

`gc`: (un)comment out the target of a motion

- (for example, `gcap` to comment out a paragraph)
- in `Visual` mode to (un)comment out the selection
- in `Operator pending` mode to target a comment.
- You can also use it as a command
  - with a range like `:7,17Commentary`
  - as part of a `:global` invocation like with `:g/TODO/Commentary`

`gcgc` uncomments a set of adjacent commented lines.
