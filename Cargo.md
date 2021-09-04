# Cargo

[[Rust]] package manager

**The Cargo Book**: <https://doc.rust-lang.org/cargo/>

**How to deal with large Cargo workspaces in Rust**: <https://kerkour.com/blog/rust-large-cargo-workspace/>

## Commands

`cargo new` create a skeleton project in a new directory.

`cargo init` create a skeleton project in the current directory.

`cargo build` downloads dependencies and compiles the code into an executable.

`cargo run` executes `cargo build` and then runs the executable.

`cargo doc` builds HTML documentation for every dependency in the project.

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

Then you need to install the C++ Build Tools in [[Visual Studio]] (under the section called **Desktop Development with C++**)
