# Vim

- [Vim](#vim)
  - [Format document](#format-document)
  - [Macros](#macros)
    - [Record macro](#record-macro)
    - [Replay macro](#replay-macro)
    - [Replay last excuted macro](#replay-last-excuted-macro)
    - [View macros](#view-macros)
  - [Registers](#registers)
  - [`vimrc` file locations](#vimrc-file-locations)
  - [Windows](#windows)
    - [Switch between open windows](#switch-between-open-windows)
      - [Cycle through windows](#cycle-through-windows)
      - [Move to window in a specific direction](#move-to-window-in-a-specific-direction)
  - [View keybindings](#view-keybindings)
  - [Searching](#searching)
    - [Next match](#next-match)
    - [Previous match](#previous-match)
    - [Ignore casing](#ignore-casing)
      - [To turn off globally:](#to-turn-off-globally)
      - [To turn on globally:](#to-turn-on-globally)
  - [Visual mode](#visual-mode)
    - [Enter visual mode](#enter-visual-mode)
    - [Exit visual mode](#exit-visual-mode)
    - [Manipulate text](#manipulate-text)
  - [Replace character](#replace-character)
  - [Increment/decrement numbers](#incrementdecrement-numbers)

## Format document

`gg=G`

## Macros

Allowable register names for macros are the letters a-z

### Record macro

```vim
q<register><commands>q
```

### Replay macro

```vim
@<register>
```

### Replay last excuted macro

```vim
@@
```

### View macros

`:reg` or `:reg <register>`

## Registers

<https://www.brianstorti.com/vim-registers/>

## `vimrc` file locations

Enter `:version` to see list of paths that vim checks for `vimrc` files.

## Windows

### Switch between open windows

#### Cycle through windows

```text
C-w w
```

#### Move to window in a specific direction

```text
C-w [h|j|k|l]
```

## View keybindings

```vim
:help index
```

## Searching

Type `/`, then the search term, then `[Enter]`

### Next match

`n`

### Previous match

`N`

### Ignore casing

Append `\c` to the search term to ignore the casing, or `\C` to match case

e.g. `/Linux\c` or `/Linux\C`

#### To turn off globally:

`:set ignorecase` or `:set ic`

#### To turn on globally:

`:set noignorecase` or `:set noic`

## Visual mode

### Enter visual mode

- `v` -> Character mode
- `V` -> Line mode
- `C-v` -> Block mode
- `gv` -> start visual mode with last selection

### Exit visual mode

`Esc`, `C-c`, or the same key you used to enter visual mode

### Manipulate text

Comands act on the selection

- `<` -> dedent
- `>` -> indent
- `c` -> change
- `d` -> delete
- `u` -> lowercase
- `U` -> uppercase
- `y` -> yank

## Replace character

'r' -> replace single character

'R' -> enter overtype (replace) mode

## Increment/decrement numbers

- `C-a` -> increment next number
- `C-x` -> decrement next number
