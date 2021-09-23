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
