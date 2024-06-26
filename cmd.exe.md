# Windows Command Prompt

## Open as Administrator

`Win+X`, `A`

## Aliases

use `doskey.exe`

```cmd
@echo off

doskey cdh=cd %HOME%
doskey tmp=cd %TMP%

doskey ls=dir

doskey cb=cargo build $*
doskey cc=cargo check $*
doskey cr=cargo run $*

doskey gb=go build .
doskey gr=go run .
```

See <https://zwbetz.com/aliases-in-windows-command-prompt/> for more details.

### Auto-load aliases

- Add script in `%USERPROFILE%` called `aliases.cmd`
- Open the `Command Prompt` shortcut in `%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools`
- Change **Target** value to `%windir%\system32\cmd.exe /k aliases.cmd` (just add `/k aliases.cmd`)

#### [[Windows Terminal]]

- Open **Settings**
- open the `cmd.exe` profile
- append `/k aliases.cmd` to the _Command Line_ text input.

---

For more details:

- <https://zwbetz.com/aliases-in-windows-command-prompt/>
- <https://4sysops.com/archives/using-doskey-aliases/>

## `doskey`

History

```cmd
doskey /history
```

List current aliases

```cmd
doskey /macros
```

## Symbolic links (symlinks) in Windows

### Soft link

#### File

```cmd
mklink Link Target
```

#### Directory

```cmd
mklink /D Link Target
```

### Hard link

#### File

```cmd
mklink /H Link Target
```

#### Directory (Junction)

```cmd
mklink /J Link Target
```

## Pretty print %PATH% variable

`$ echo %PATH:;=&echo.%`

## Delete directories

`rmdir`

### Delete directory and contents recursively

`$ rmdir /S dir_name`

## List files

`dir`

### List all files

`$ dir /A`

### Paged

`$ dir /P`

### Wide list format

`$ dir /W`

### Sort by newest

`$ dir /O-D`

### Sort by oldest

`$ dir /OD`

## Display the contents of a file

`type`

`$ type file1 file2 file3`

## Copy files

`xcopy`

Similar to rsync

### Switches

- `/D` -> only copy if src is newer than dest
- `/F` -> display full path and file name of src and dest
- `/H` -> copy hidden/system files
- `/I` -> assume dest is a directory
- `/L` -> dry run

## Batch files

`.bat` extension

`@ECHO OFF` - don't echo the commands in the batch file

`@PAUSE` - keep the window open after the batch file finishes

`REM` - start comment

## Check if a port is in use

```cmd
# run as Administrator
netstat -aon | findstr PORT_NUMBER
```

## Check reserved ports

```cmd
# run as Administrator
netsh interface ipv4 show excludedportrange protocol=tcp
```

## `powercfg`

For controlling _power schemes* (also called *power schemes_)
