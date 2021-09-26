# Visual Studio Code

## Configure specific elements in theme

example: remove italics on comments in the HCQ (High Color Queries) theme

```json
"editor.tokenColorCustomizations": {
    "[HCQ (High Color Queries)]": {// theme name
        "textMateRules": [
            {
                "scope": "comment",
                "settings": {
                    "fontStyle": ""// remove italics on comments
                }
            }
        ]
    },
},
```

## Export list of Extensions to text

- open Terminal in Code and enter the command `code --list-extensions | xargs -L 1 echo code --install-extension`
- To install the same extensions in a new VS Code environment (new machine, etc.), just take the output from the above and paste into the Terminal (see <https://stackoverflow.com/a/49398449)>

## Launch Tasks

### Persist output

To print a launch task's output to a file:

In the object for the task in `task.json`, with label `build` add entry to `args` array:

### build logger

add `/fileLogger`

will output to a file named `msbuild.log` in the project directory

#### `dotnet run`

add `/property:verbosity=detailed`

allowed values:

- `q[uiet]`
- `m[inimal]` (default setting)
- `n[ormal]`
- `d[etailed]`
- `diag[nostic]`

## Make `Ctrl+s` act more like [[Emacs]]

In [[Emacs]], the keybinding `C-s` will start a search, but entering `C-s` again will find the next match. This can be done in VS Code by setting the `When` clause carefully:

- Open **Keyboard Shortcuts**
  - Set the **Command** `Find` (`actions.find`)
    - **Keybinding**: `Ctrl + S`
    - **When clause**: `editorFocus || editorIsOpen`
  - Set the **Command** `Find Next` (`editor.action.nextMatchFindAction`)
    - **Keybinding**: `Ctrl + S`
    - **When clause**: `editorFocus && editorHasSelection`
- Open **Settings**
  - Go to the setting **Editor › Find: Seed Search String From Selection**
    - Set the value to `selection`
