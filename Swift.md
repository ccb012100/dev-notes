# Swift programming language

documentation ([1](https://developer.apple.com/documentation/Swift),[2](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/))

## `swift` CLI utility

```zsh
# create a new package
swift package init
# remove build artifacts
swift package clean
# build the package
swift build
# make a release build
swift build -c release -Xswiftc -cross-module-optimization
# print the full binary path of the built executable without building it
swift build --show-bin-path -c release
# run the package
swift run
# specify the executable name to be able to pass arguments to it
swift run EXECUTABLE_NAME [arguments]
```

## Documentation comments

To create documentation comments, use `///` for single-line, or `/** */` for multi-line.

The comments use **Markdown** syntax for formatting.

(source [1](https://www.swift.org/documentation/docc/formatting-your-documentation-content), [2](https://www.swift.org/documentation/docc/writing-symbol-documentation-in-your-source-files))
