# iTerm 2

[iTerm2](https://iterm2.com/) **macOS** terminal emulator.

<https://iterm2.com/documentation-scripting-fundamentals.html>

## Scripting

### AppleScript

[Documentation](https://iterm2.com/documentation-scripting.html)

The script:

```osascript
tell application "iTerm2"
```

only works if **iTerm2** is already running.

The script:

```osascript
tell application "iTerm"
```

always works.

### Python API

[Documentation](https://iterm2.com/python-api/)

```python
import iterm2, os, sys

async def validate_path(path, connection):
    """Alert user and exit if `path` does not exist"""
    if not os.path.exists(path):
        await iterm2.Alert(
            "iTerm2 Python Script Error!",
            f"The directory {path} does not exist!\n\nAborting script\n<{os.path.realpath(__file__)}>",
        ).async_run(connection)

        sys.exit(1)


async def main(connection):
    await iterm2.async_get_app(connection)

    repo_dir = "/Users/jdoe/src/foo-bar"

    await validate_path(repo_dir, connection)

    # create a new window with a single tab and create a reference the tab
    script_window = await iterm2.Window.async_create(connection)
    session = script_window.current_tab.current_session

    await session.async_send_text(
        f"cd {repo_dir} && echo this will print in the new window\n"
    )

    # split the current tab and create a reference to the new pane
    await session.async_split_pane(vertical=True)
    session = script_window.current_tab.current_session

    # run command in the new pane
    await session.async_send_text(
        f"echo this will print in pane 2\n"
    )


iterm2.run_until_complete(main, True)
```

### Session/Environment variables

See the section _Setting User-Defined Variables_ in this [documentation](https://iterm2.com/documentation-scripting-fundamentals.html#)
