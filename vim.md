# Vim

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
