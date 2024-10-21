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

## View Application dictionaries

- Open **Script Editor**
- Go to `File ➤ Open Dictionary` (`⇧⌘O`)

## Logging

- If running via `osascript` in a CLI or the **Script Editor**, use `log TEXT`
  - In a terminal, it will print to stdout
  - In **Script Editor**, it will print in the **Replies** pane
- If running elsewhere, use `dialog TEXT` to open a system dialog

## Toggle the visibility of an application

Using **WezTerm** as a example

```applescript
tell application "System Events"
  set currentApp to name of first process where it is frontmost
end tell

if currentApp is equal to "wezterm-gui"
  tell application "System events"
    try
      set visible of application process "wezterm-gui" to false
    end try
  end tell
else
  tell application "WezTerm"
    activate
  end tell
end
```
