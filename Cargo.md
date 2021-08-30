# Cargo

[[Rust]] package manager

**The Cargo Book**: <https://doc.rust-lang.org/cargo/>

**How to deal with large Cargo workspaces in Rust**: <https://kerkour.com/blog/rust-large-cargo-workspace/>

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

Then you need to install the **C++ Build Tools** in [[Visual Studio]]
