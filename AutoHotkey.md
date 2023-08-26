# AutoHotkey (`AHK`) v2

[Version 2 docs](https://www.autohotkey.com/docs/v2/)

[Hotkeys docs](https://www.autohotkey.com/docs/v2/Hotkeys.htm)

## Active Window

Use the letter `A` for `WinTitle`, and omit the other three window parameters (`WinText`, `ExcludeTitle` `ExcludeText`),
to operate on the active window.

_example_: `WinGetTitle("A")`

## `WinGetActiveStats`

Doesn't exist in v1. v2 equivalent:

```ahk
Title := WinGetTitle("A")
WinGetPos &X, &Y, &W, &H, "A"
```

## Monitor Work Area

The monitor's Work Area is less than its Height and Width (due to GUI chrome like the taskbar), so work area should be
used instead. Use the function [`MonitorGetWorkArea`](https://www.autohotkey.com/docs/v2/lib/MonitorGetWorkArea.htm)
