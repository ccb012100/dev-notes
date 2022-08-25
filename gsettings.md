# Gsettings

[[GNOME]] settings configuration tool

## Finding keybindings

`gsettings list-recursively | rg keybinding`

or

```bash
gsettings list-recursively | rg "wm\.keybindings|shell\.keybindings" | sort
```

### Unbound settings

Unbound settings will show up with the keybinding `@as []`

## Settings keybindings

`gsettings set SETTING_NAME KEYBINDING`

e.g.

```bash
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>comma']"
```
