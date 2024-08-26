# `clap`

[Command Line Argument Parser](https://github.com/clap-rs/clap) Rust crate.

## Using `derive`

**Problem**: Get the compiler error:

> ``error: cannot find derive macro `Parser` in this scope``

**Solution**: Make sure when adding the crate to add it with the command `cargo add clap --features derive`.

> `cargo add clap --features derive`

## `default_missing_values`

This attribute doesn't seem to work correctly with a `Vec` flag. After trying to use it with a minimal example, it doesn't seem to honor `num_args`
and I can't figure out why or how to get it to.
