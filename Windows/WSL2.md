# WSL2

## Cargo

### permissions error

If you get errors similar to the following when running `cargo` commands:

```bash
error: could not exec the linker `cc`
  |
  = note: Permission denied (os error 13)
  = note: "cc" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-m64" "-Wl,--eh-frame-hdr" "-L" "/home/bagel/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib"
```

It can be resolved by running the command `sudo apt install build-essential`

_source:_ <https://github.com/rust-lang/cargo/issues/6757#issuecomment-738494343>
