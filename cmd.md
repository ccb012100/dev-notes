# Windows Command Prompt

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

## %PATH%

pretty print: `$ echo %PATH:;=&echo.%`
