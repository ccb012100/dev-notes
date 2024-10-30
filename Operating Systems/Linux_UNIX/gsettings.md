# Gsettings

GNOME settings configuration tool

## Finding keybindings

`gsettings list-recursively | rg keybinding`

or

```bash
gsettings list-recursively | rg "wm\.keybindings|shell\.keybindings" | sort
```

### Unbound settings

Unbound settings will show up with the keybinding `@as []`

## Setting keybindings

`gsettings set SETTING_NAME "['KEYBINDING']"`

Make sure to wrap the array in quotes (`"`)

_example:_

```bash
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>comma']"
```

### Setting multiple keybindings for an action

Notice above that the `set` command takes an _array_ of keybindings.

_example:_

```bash
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>h', '<Ctrl><Shift><Alt>h']"
```
