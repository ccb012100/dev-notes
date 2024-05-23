# AppleScript language

[Documentation](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)

## Get current directory

```osascript
set my_POSIX_path to POSIX path of ((path to me as text) & "::")
```

source: <https://apple.stackexchange.com/a/457543>

## Commands

[Reference](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html)

`activate`

- Brings an application to the front, and opens it if it is on the local computer and not already running.

`launch`

- Launches the specified application without sending it a `run` command.

`run`

- For an application, launches it.
- For a script application, launches it and sends it the `run` command.
- For a script script object, executes its `run` handler.

## iTerm2

See [iTerm2.md](iTerm2.md) for details regarding using AppleScript to interact with **iTerm2**.
