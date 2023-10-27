# Rust

## Attributes

`#!` - global to item the attribute is within

`#` - only to item following attribute

> _Inner attributes_, written with a bang (`!`) after the hash (`#`), apply to the item that the attribute is declared
> within. _Outer attributes_, written without the bang after the hash, apply to the thing that follows the attribute.

(_source_: <https://doc.rust-lang.org/reference/attributes.html>)

## Suppress (hide) Compiler warnings

Use the `allow` attribute:

```rs
#![allow(unused_variables)]

#![allow(dead_code)]

#![allow(unused_assignments)]
```

For unused variables, you can also prefix the variable name with an underscore (`_`).

## `never` type

a.k.a 'empty type'

`!`

Functions that returns the `never` type (`-> !`) are called `diverging functions`.

`sources`:

- <https://doc.rust-lang.org/std/primitive.never.html>
- <https://doc.rust-lang.org/nightly/book/ch19-04-advanced-types.html#the-never-type-that-never-returns>

## `std::unimplemented`

Use the `unimplemented` macro to panic with a message of "not implemented".

## Configuration conditional checks

### Conditional evaluation

`cfg!(...)` macro

- code evaluates at runtime to `true` or `false`

### Conditional compilation

`#[cfg(...)]` attribute

- removes code during compilation

### Concat 2 strings

#### 2 `&str`

```rs
let s3: String = format!("{}{}", s1, s2)

```

#### `String` & `&str`

```rs
let s3: String = s1 + s2

// can also use format! macro
let s3: String = format!("{}{}", s1, s2)
```
