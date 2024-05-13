# vim-plug

Vim/Neovim plugin manager

<https://github.com/junegunn/vim-plug>

## Installing a package

Using `EasyMotion` (<https://github.com/easymotion/vim-easymotion>) as the example:

1. In the init file, add:

    ```vim
    call plug#begin()
    Plug 'easymotion/vim-easymotion'
    call plug#end()
    ```

2. Call `:PlugInstall`

## Installation failure

If the editor doesn't install vim-plug after adding `plug.vim` to the `autoload` directory according to [the
instructions](https://github.com/junegunn/vim-plug#installation), then check that the runtime path is correct (`:echo
&rtp`).

The instructions for Windows seems to differ from reality.
