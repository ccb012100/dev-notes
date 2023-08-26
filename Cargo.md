# Cargo

[[Rust]] package manager

- [Cargo](#cargo)
  - [Commands](#commands)
  - [`cargo new`](#cargo-new)
  - [Running in [[Windows]]](#running-in-windows)
    - [link.exe error](#linkexe-error)
  - [`cargo-edit`](#cargo-edit)
    - [Build failure in Windows](#build-failure-in-windows)
    - [build failure in [[WSL]]](#build-failure-in-wsl2)
  - [Set `RUST_BACKTRACE`](#set-rust_backtrace)
    - [[[Windows]]](#windows)
    - [[[Linux]]](#linux)
  - [Update installed Cargo packages](#update-installed-cargo-packages)

**The Cargo Book**: <https://doc.rust-lang.org/cargo/>

**How to deal with large Cargo workspaces in Rust**: <https://kerkour.com/blog/rust-large-cargo-workspace/>

## Commands

- `new` - create a skeleton project in a new directory.
- `init` - create a skeleton project in the current directory.
- `build` - downloads dependencies and compiles the code into an executable.
- `run` - executes `cargo build` and then runs the executable.
- `doc` - builds HTML documentation for every dependency in the project.

## `cargo new`

```bash
# new package
cargo new hello_world

# create without initializing a git repo
cargo new hello_world --vcs none

# new library
cargo new hello_world --lib

```

## Running in [[Windows]]

### link.exe error

If `cargo build` fails with an error about `link.exe`:

```cmd
error: linker `link.exe` not found
  |
  = note: The system cannot find the file specified. (os error 2)

note: the msvc targets depend on the msvc linker but `link.exe` was not found

note: please ensure that VS 2013, VS 2015, VS 2017 or VS 2019 was installed with the Visual C++ option

error: aborting due to previous error
```

Then you need to install the C++ Build Tools in [[Visual Studio]] (under the section called **Desktop Development with C++**).

If errors continue, then try running `rustup default stable-x86_64-pc-windows-gnu`.

## `cargo-edit`

Run `cargo install cargo-edit`

Now packages can be added to a project with the command `cargo add $package_name`

### Build failure in Windows

```plaintext
The pkg-config command could not be found.

Most likely, you need to install a pkg-config package for your OS.

If you've already installed it, ensure the pkg-config command is one of the directories in the PATH environment variable.
```

<https://download.gnome.org/binaries/win32/dependencies/pkg-config_0.26-1_win32.zip>

### build failure in [[WSL]]

`openssl` and `libdevssl` need to be installed in Linux before you can install `cargo-edit`.

WSL2 doesn't install `libssl-dev` by default, so you will get this error if you don't run `sudo apt install libssl-dev` before trying to install `cargo-edit`.

```bash
run pkg_config fail: "`\"pkg-config\" \"--libs\" \"--cflags\" \"openssl\"` did not exit successfully: exit status: 1\n--- stderr\nPackage openssl was not found in the pkg-config search path.\nPerhaps you should add the directory containing `openssl.pc'\nto the PKG_CONFIG_PATH environment variable\nNo package 'openssl' found\n"
```

## Set `RUST_BACKTRACE`

### [[Windows]]

```cmd
set RUST_BACKTRACE=1
```

### [[Linux]]

```bash
export RUST_BACKTRACE=1
```

## Update installed Cargo packages

```bash
# method 1

cargo install --list | awk -F ' ' '/^\s/ {print $1}' | xargs cargo install

# method 2

cargo install cargo-update
cargo install-update -a
```
