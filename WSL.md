# WSL

Windows Subsystem for Linux 2

- [WSL](#wsl)
  - [Commands](#commands)
  - [Signed Git commits with \[\[GPG\]\]](#signed-git-commits-with-gpg)
  - [\[\[Cargo\]\]](#cargo)
    - [permissions error](#permissions-error)
  - [clock skew](#clock-skew)
    - [Syptom](#syptom)
    - [Solution](#solution)
  - [open web browser](#open-web-browser)
    - [`xdg-open`](#xdg-open)
    - [`wslu`](#wslu)
  - [disable appending \[\[Windows\]\] `%PATH%` from `$PATH`](#disable-appending-windows-path-from-path)
  - [WSL2 won't release memory](#wsl2-wont-release-memory)

## Commands

```cmd
REM list all instances
wsl --list --verbose

REM list only running instances
wsl --list --verbose --running

REM stop instance
wsl --terminate <DISTRO_NAME>

REM shutdown all
wsl --shutdown
```

## Signed Git commits with [[GPG]]

Install Gpg4win: <https://www.gpg4win.org/>

<https://www.39digits.com/signed-git-commits-on-wsl2-using-visual-studio-code>

## [[Cargo]]

### permissions error

If you get errors similar to the following when running `cargo` commands:

```bash
error: could not exec the linker `cc`
  |
  = note: Permission denied (os error 13)
  = note: "cc" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-m64" "-Wl,--eh-frame-hdr" "-L" "/home/bagel/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib"
```

It can be resolved by running the command

```bash
sudo apt-get install build-essential
```

_source:_ <https://github.com/rust-lang/cargo/issues/6757#issuecomment-738494343>

## clock skew

### Syptom

WSL clock gets out of sync, usually after hibernating/sleeping

### Solution

Use the `systemd-timesyncd` fix detailed in [this GitHub issue](https://github.com/microsoft/WSL/issues/8204#issuecomment-1338334154)

## open web browser

### `xdg-open`

To configure `xdg-open`:

- create a link to the browser: `ln -s /mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe ~/bin/msedge.exe`
- add `export BROWSER=msedge.exe` to the shell profile

### `wslu`

- Install `xdg-utils`
  - `sudo apt install xdg-utils`
- Install [wslu](https://wslutiliti.es/wslu/)
  - _Note_: _don't use the Ubuntu repo version_; it is no longer updated
  - sudo add-apt-repository ppa:wslutilities/wslu
        sudo apt update
        sudo apt install wslu

## disable appending [[Windows]] `%PATH%` from `$PATH`

In `/etc/wsl.conf`, set `interop::appendWindowsPath` to `false`

## WSL2 won't release memory

Make sure `autoMemoryReclaim` is set in [`%USERPROFILE%\.wslconfig`](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig).

Even though it should be set by default to `dropcache`, it seems that, on **Windows 10** at least, it has to be set explicitly to actually work.

see <https://github.com/microsoft/WSL/issues/4166>
