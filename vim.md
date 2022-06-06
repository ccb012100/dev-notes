# Vim

- [Vim](#vim)
  - [Normal mode](#normal-mode)
    - [Scroll screen, centered on cursor](#scroll-screen-centered-on-cursor)
    - [Format document](#format-document)
    - [Macros](#macros)
      - [Record macro](#record-macro)
      - [Replay macro](#replay-macro)
      - [Replay last excuted macro](#replay-last-excuted-macro)
      - [View macros](#view-macros)
    - [Registers](#registers)
    - [`vimrc` file locations](#vimrc-file-locations)
    - [View keybindings](#view-keybindings)
    - [Searching](#searching)
      - [Ignore casing](#ignore-casing)
        - [To turn off globally:](#to-turn-off-globally)
        - [To turn on globally:](#to-turn-on-globally)
    - [Increment/decrement numbers](#incrementdecrement-numbers)
    - [Navigation](#navigation)
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
z<CR>  " focus cursor on top
z-        " focus cursor on bottom
z.        " focus cursor in center
zz        " focus cursor in center

12z+      " focus cursor on line 12
```

### Format document

```vim
gg=G
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

#### Replay last excuted macro

```vim
@@
```

#### View macros

```vim
:reg

:reg <register>
```

### Registers

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

### Navigation

```vim
H   " Top of screen ('Highest')
M   " Middle of screen ('Middle')
L   " Bottom of screen ('Lowest')

(   " Beggining of sentence
)   " End of sentence

{   " Beginning of paragraph
}   " End of paragraph

gM  " go to character at middle of the text line
gm  " go to character at middle of the screenline

zj  " move to the start of the next fold
zk  " move to the start of the previous fold
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
:sp file          " open a file in a new split window
:vs file          " open a file in a new vertical split window

CTRL-W q         " quit window
CTRL-W o         " quit all but current window

CTRL-W {motion}  " move to window in direction of motion
CTRL-W w         " go to next window
CTRL-W p         " go to previous window

CTRL-W +         " increase window height
CTRL-W -         " decrease window height
CTRL-W <         " decrease window width
CTRL-W >         " increase window width

CTRL-W H           move current window to the far left
CTRL-W J           move current window to the very bottom
CTRL-W K           move current window to the very top
CTRL-W L           move current window to the far right
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

Comands act on the selection

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
