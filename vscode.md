# Visual Studio Code

- [Visual Studio Code](#visual-studio-code)
  - [Configure specific elements in theme](#configure-specific-elements-in-theme)
  - [Configure language specific settings for multiple languages](#configure-language-specific-settings-for-multiple-languages)
  - [Export list of Extensions to text](#export-list-of-extensions-to-text)
  - [Launch Tasks](#launch-tasks)
    - [Persist output](#persist-output)
    - [build logger](#build-logger)
      - [`dotnet run`](#dotnet-run)
  - [Keybindings](#keybindings)
    - [Make `Ctrl+s` act more like \[\[Emacs\]\]](#make-ctrls-act-more-like-emacs)
    - [Use same keybinding to toggle focus to Editor/Explorer](#use-same-keybinding-to-toggle-focus-to-editorexplorer)
    - [Cycle though Quick Fix popup menu](#cycle-though-quick-fix-popup-menu)
  - [Hide Extension Snippet from Intellisense](#hide-extension-snippet-from-intellisense)
  - [Disable `UpArrow`/`DownArrow` cycling through commit messages in the Source Control commit message textbox](#disable-uparrowdownarrow-cycling-through-commit-messages-in-the-source-control-commit-message-textbox)
  - [Settings file location](#settings-file-location)
    - [Windows](#windows)
    - [macOS](#macos)
    - [Linux](#linux)
  - [Installing on Mac with Homebrew](#installing-on-mac-with-homebrew)
  - [Inspect vscode context](#inspect-vscode-context)
  - [Change font size for tab titles, sidebar, etc.](#change-font-size-for-tab-titles-sidebar-etc)

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

## Configure language specific settings for multiple languages

List each language separated by brackets, i.e. `[lang_1][lang_2][...][lang_n]`

```json
"[csharp][markdown][javascript][typescript][json][html]": {
    "editor.rulers": [120]
}
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

## Keybindings

### Make `Ctrl+s` act more like [[Emacs]]

In [[Emacs]], the keybinding `C-s` will start a search, but entering `C-s` again will find the next match. This can be done in VS Code by setting the `When` clause carefully:

```json
{
  "key": "ctrl+s",
  "command": "actions.find",
  "when": "editorFocus || editorIsOpen"
},
{
  "key": "ctrl+s",
  "command": "editor.action.nextMatchFindAction",
  "when": "editorFocus && editorHasSelection"
}
```

### Use same keybinding to toggle focus to Editor/Explorer

Focus on Editor. If Editor is already in focus, focus on Explorer.

```json
{
  "key": "ctrl+, e",
  "command": "workbench.files.action.focusOpenEditorsView",
  "when": "editorFocus"
},
{
  "key": "ctrl+, e",
  "command": "workbench.action.focusActiveEditorGroup",
  "when": "editorFocus"
}
```

### Cycle though Quick Fix popup menu

To cycle through the list of actions in the Quick Fix popup, use the keybindings `selectNextCodeAction` and `selectPrevCodeAction`

## Hide Extension Snippet from Intellisense

I wanted to turn off the `markdownlint` extension's snippets, and this was the solution I found:

- Open the Command Pallette
- Chose **Insert Snippet**
- Hover over the snippet and click the eye icon to hide/show the snippet in Intellisense

_source_: <https://github.com/microsoft/vscode/issues/10565#issuecomment-721832613>

## Disable `UpArrow`/`DownArrow` cycling through commit messages in the Source Control commit message textbox

In the keybindings find and disable `UpArrow`/`DownArrow` bindings `scm.viewNextCommit` and `scm.viewPreviousCommit` (They are also bound to `Alt + UpArrow` and `Alt + DownArrow`).

## Settings file location

### Windows

`%APPDATA%\Code\User\settings.json`

### macOS

`$HOME/Library/Application\ Support/Code/User/settings.json`

### Linux

`$HOME/.config/Code/User/settings.json`

## Installing on Mac with Homebrew

```bash
brew install visual-studio-code
```

## Inspect vscode context

To inspect the context of the current vs code instance:

1. Run the command `Developer: Toggle Developer Tools`
2. Run the command `Developer: Inspect Context Keys`
3. Click on the element you want to inspect the context for

This will print the current context will be logged to the Developer Tools javascript console

## Change font size for tab titles, sidebar, etc.

In settings, change `window.zoomLevel`, then change `editor.fontSize` to adjust the editor font to the new zoom level.

## Git error: `TypeError: Cannot read properties of undefined (reading 'replace')?`

Solution when [[Git]] operations in [[Windows]] result in a failure originating in `%HOME%\AppData\Local\Programs\Microsoft VS Code\resources\app\extensions\git\dist\askpass-main.js`:

Add to `%HOME%\.gitconfig`:

```ini
[core]
  sshCommand = SSH_ASKPASS=\"C:\\Program Files\\Git\\mingw64\\libexec\\git-core\\git-gui--askpass\" ssh
```

_Source_: <https://github.com/microsoft/vscode/issues/166832#issuecomment-1488827368>
