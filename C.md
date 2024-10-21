# C programming language

## Compiler flags

```bash
clang -std=c99 -g3 -Wall -Wextra -Wshadow -Wdouble-promotion -fsanitize=address,undefined -Wstrict-prototypes -Wmissing-prototypes
```

([source](https://nullprogram.com/blog/2023/04/29/))

## macOS

### `dSYM` folder

Created by `dsymutil`. Called by the compiler during a build to link the **DWARF** debugging information to the executable.

([source](https://stackoverflow.com/a/32299029))

## Builtin/Predefined macros

### Standard Predefined Macros

Specified by the language standards

- `__FILE__`
- `__LINE__`
- `__DATE__`
- `__TIME__`
- `__STDC__`
- `__STDC_VERSION__`
- `__STDC_HOSTED__`
- `__OBJC__`
- `__ASSEMBLER__`

([source](https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html))

### Clang

- `__BASE_FILE__`
- `__FILE_NAME__`
- `__COUNTER__`
  - Defined to an integer value that starts at zero and is incremented each time the `__COUNTER__` macro is expanded.
- `__INCLUDE_LEVEL__`
- `__TIMESTAMP__`
- `__clang__`
- `__clang_major__`
- `__clang_minor__`
- `__clang_patchlevel__`
- `__clang_version__`
- `__clang_literal_encoding__`
- `__clang_wide_literal_encoding__`

([source](https://clang.llvm.org/docs/LanguageExtensions.html#builtin-macros))

## Debugger breakpoint on `assert`s

```c
#ifdef DEBUG
#  if __GNUC__
#    define assert(c) if (!(c)) __builtin_trap()
#  elif _MSC_VER
#    define assert(c) if (!(c)) __debugbreak()
#  else
#    define assert(c) if (!(c)) *(volatile int *)0 = 0
#  endif
#else
#  define assert(c)
#endif
```

([source](https://nullprogram.com/blog/2022/06/26/))
