## MSYS2

### inherit the Windows $PATH

- [edit Windows Environment variables](https://sourceforge.net/p/msys2/discussion/general/thread/dbe17030/#3f85)
  - add `MSYS2_PATH_TYPE=inherit`

### add MSYS2 to context menu

- <https://gist.github.com/elieux/ef044468d067d68040c7>
- <https://github.com/njzhangyifei/msys2-mingw-shortcut-menus>
- create new `.reg` file:
  - `[HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\MSYS here\command] @="C:\\msys64\\msys2.exe bash"`

### Configure SSH

- see this procedure: <https://github.com/OULibraries/msys2-setup/blob/master/02-ssh.md>
