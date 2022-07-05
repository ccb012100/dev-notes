# terminator

Terminator terminal emulator

<https://terminator-gtk3.readthedocs.io/en/latest/index.html>

## Custom keybinds

```plaintext
F1 - help
F11 - fullscreen

<Shift>+<PgUp> - scroll up half a page
<Shift>+<PgDn> - scroll down half a page
```

`<Alt+Super+>`:

```plaintext
N           - scroll down one line
P           - scroll up one line

Q           - Close Window
<Shift>+Q   - Close terminal

R           - Reset Terminal
<Shift>+R   - Reset and clear terminal

W           - Create new window
T           - Create new tab
```

### Acting on terminals

`Ctrl+Shift+`:

```plaintext
C - Copy
V - Paste

F - Search terminal scrollback

N - Move focus to next pane
P - Move focus to previous pane

Z - Toggle maximized terminal (Zoom)

<Return>        - Split horizontally
<Tab>           - Split vertically

<UpArrow>       - Resize the terminal Up
<DownArrow>     - Resize the terminal Down
<LeftArrow>     - Resize the terminal Left
<RightArrow>    - Resize the terminal Right
```

`Alt+Super+`:

```plaintext
<UpArrow>       - Move focus to terminal Above
<DownArrow>     - Resize the terminal Below
<LeftArrow>     - Resize the terminal Left
<RightArrow>    - Resize the terminal Right
```

### Acting on tabs

`Alt+Super+`:

```plaintext
N - Next Tab
P - Previous Tab

, - Rotate terminal counter-clockwise
. - Rotate terminals clockwise

[1-0] - Switch to tab #1-10
```

## Unable to set keybindings

If you suddenly can't set any keybindings through the Preferences GUI, run the command

`rg None ~/.config/terminator/config`

If any keybindings are disabled with the setting `None`, they will break the keybinding tool. They should be changed to
`""`.

Run the command `sed -i "s/None/""/g" ~/.config/terminator/config` to fix the invalid values.

_source: <https://github.com/gnome-terminator/terminator/issues/548>_
