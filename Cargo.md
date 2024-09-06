# Cargo

Rust package manager

**The Cargo Book**: <https://doc.rust-lang.org/cargo/>

**How to deal with large Cargo workspaces in Rust**: <https://kerkour.com/blog/rust-large-cargo-workspace/>

## `cargo new`

Create a new cargo package (use `cargo init` to create the package in an existing directory)

```bash
# new package
cargo new hello_world

# create without initializing a git repo
cargo new hello_world --vcs none

# new library
cargo new hello_world --lib

```

## `cargo add` vs. `cargo install`

Use `add`/`remove` to add dependencies to your project's manifest.

Use `install`/`uninstall` to install Rust binaries to your system (`$HOME/.cargo/bin`)

## Running in Windows

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

```console
The pkg-config command could not be found.

Most likely, you need to install a pkg-config package for your OS.

If you've already installed it, ensure the pkg-config command is one of the directories in the PATH environment variable.
```

<https://download.gnome.org/binaries/win32/dependencies/pkg-config_0.26-1_win32.zip>

### build failure in WSL

`openssl` and `libdevssl` need to be installed in Linux before you can install `cargo-edit`.

WSL2 doesn't install `libssl-dev` by default, so you will get this error if you don't run `sudo apt install libssl-dev` before trying to install `cargo-edit`.

```bash
run pkg_config fail: "`\"pkg-config\" \"--libs\" \"--cflags\" \"openssl\"` did not exit successfully: exit status: 1\n--- stderr\nPackage openssl was not found in the pkg-config search path.\nPerhaps you should add the directory containing `openssl.pc'\nto the PKG_CONFIG_PATH environment variable\nNo package 'openssl' found\n"
```

## Set `RUST_BACKTRACE`

### Windows

```cmd
set RUST_BACKTRACE=1
```

### Linux

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
