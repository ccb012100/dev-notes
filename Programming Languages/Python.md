# Python programming language

## print object to console

use `vars()` and optionally `pprint` (pretty-print)

```py
from pprint import pprint

# Create object
obj = MyClass()

# pretty-print the properties
pprint(vars(obj))
```

## `@dataclass` vs `TypedDict`

Use the `@dataclass` when you need a strongly typed class; works with `Union` types and `isinstance`.

Use `TypedDict` when you want duck typing; does _not_ work with `instance`.

## default function arguments

Default arguments are evaluated only once, on function definition.

If the default argument is mutable, it acts as a static variable on the function; this is useful for caching, memoizing,
etc.

If you don't want a mutable variable, use an immutable default arg; using `None` is idiomatic.

## Pip

### Installation error on Windows

#### Problem

When trying to install a Python package on Windows, an error similar to the following occurs:

```txt
  WARNING: Failed to write executable - trying to use .deleteme logic
ERROR: Could not install packages due to an OSError: [WinError 2] The system cannot find the file specified: 'C:\\Python312\\Scripts\\markdown-it.exe' -> 'C:\\Python312\\Scripts\\markdown-it.exe.deleteme'
```

#### Solution

Run the command `py -m pip install pip-run --user`
