# Cmder

## Tasks

### WSL

in `Task parameters` textbox:

```cmd
/icon %USERPROFILE%\AppData\Local\lxss\bash.ico
```

in `Commands` textbox:

```cmd
cmd /c C:\Windows\System32\bash.exe ~ -new_console:p:%USERPROFILE%
```

### MSYS2

in `Commands` textbox:

```cmd
-new_console:d:C:\tools\msys64\home\{username}  set CHERE_INVOKING=1 & set MSYSTEM=MINGW64 & set MSYS2_PATH_TYPE=inherit & "c:\tools\msys64\usr\bin\zsh" --login -i
```
