# Windows Command Prompt

- [Windows Command Prompt](#windows-command-prompt)
  - [Aliases](#aliases)
    - [Auto-load aliases](#auto-load-aliases)
      - [Windows Terminal](#windows-terminal)
  - [`doskey`](#doskey)
  - [Symbolic links (symlinks) in [[Windows]]](#symbolic-links-symlinks-in-windows)
    - [Soft link](#soft-link)
      - [File](#file)
      - [Directory](#directory)
    - [Hard link](#hard-link)
      - [File](#file-1)
      - [Directory (Junction)](#directory-junction)
  - [Pretty print %PATH% variable](#pretty-print-path-variable)
  - [Delete directories](#delete-directories)
    - [Delete directory and contents recursively](#delete-directory-and-contents-recursively)
  - [List files](#list-files)
    - [List all files](#list-all-files)
    - [Paged](#paged)
    - [Wide list format](#wide-list-format)
    - [Sort by newest](#sort-by-newest)
    - [Sort by oldest](#sort-by-oldest)
  - [Display the contents of a file](#display-the-contents-of-a-file)

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

#### Windows Terminal

In **Settings**, open the `cmd` profile, and under the **General** section, change the value of _Command Line_ to `cmd.exe /k aliases.cmd`.

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

## Symbolic links (symlinks) in [[Windows]]

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
