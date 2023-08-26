# GNOME

Desktop Environment (DE) for [[Linux]]. Used by [[Ubuntu]]

- [GNOME](#gnome)
  - [GSettings](#gsettings)
  - [Add top bar to all monitors](#add-top-bar-to-all-monitors)
  - [Restart GNOME Shell](#restart-gnome-shell)
  - [Gnome Extensions](#gnome-extensions)
  - ["Phantom" extensions](#phantom-extensions)
    - [Integration with Chrome](#integration-with-chrome)
    - [Extension fails to load after update](#extension-fails-to-load-after-update)
  - [Keybindings](#keybindings)
    - ["Select All" shortcut](#select-all-shortcut)
    - [List keybindings](#list-keybindings)
    - [Rebind keybindings](#rebind-keybindings)
      - [Multiple keybindings for an action](#multiple-keybindings-for-an-action)
      - [`<Super>+P` toggles display](#superp-toggles-display)
      - [unset SUPER+o](#unset-supero)
      - [rebind SUPER+SHIFT+,](#rebind-supershift)
  - [Move Open/Save/Cancel modal buttons to bottom of dialogue](#move-opensavecancel-modal-buttons-to-bottom-of-dialogue)
  - [Can't set keybindings in GUI](#cant-set-keybindings-in-gui)
  - [Set text scaling factor](#set-text-scaling-factor)

## GSettings

Many GNOME and GNOME apps/extensions use GSettings to store settings in a key-based configuration system called `dconf`.

They can be viewed/edited through the `gsettings` command or the `dconf-editor` package.

## Add top bar to all monitors

Use [Multi Monitors Add-On](https://github.com/realh/multi-monitors-add-on)

## Restart GNOME Shell

Open Task Runner and run command `r`

On [[Wayland]], you have to run terminal command `killall -3 gnome-shell`

## Gnome Extensions

<https://extensions.gnome.org/>

## "Phantom" extensions

This is for an issue where GNOME keeps trying to install an extension every time the screen locks. In my case, it was
`ubuntu-app-indicator`, so I'll use that as the example.

First, run `gsettings list-recursively | rg APP_NAME

```bash
❯ gsettings list-recursively | rg -F 'app-indicator'

org.gnome.shell enabled-extensions ['appindicatorsupport@rgcjonas.gmail.com', 'tiling-assistant@leleat-on-github', 'desktop-icons@csoriano', 'ubuntu-appindicators@ubuntu.com', 'panelScroll@sun.wxg@gmail.com', 'touchpad-indicator@orangeshirt', 'gestureImprovements@gestures', 'workspace-switch-wraparound@theychx.org', 'multi-monitors-add-on@spin83', 'impatience@gfxmonk.net', 'trayIconsReloaded@selfmade.pl', 'babar@fthx', 'ubuntu-dock@ubuntu.com', 'walkpaper@walkpaper.blinkbp.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'sound-output-device-chooser@kgshank.net', 'caffeine@patapon.info', 'cpupower@mko-sl.de', 'horizontal-workspace-indicator@tty2.io']
```

If it shows up in the enabled-extensions, try `gsettings uninstall APP_NAME`.

If you get a response that the extension does not exist, run `gsettings reset APP_NAME`. This should remove it from the
list.

```bash

❯ gnome-extensions uninstall 'ubuntu-appindicators@ubuntu.com'

Extension “ubuntu-appindicators@ubuntu.com” doesn't exist

❯ gnome-extensions reset 'ubuntu-appindicators@ubuntu.com'

❯ gsettings list-recursively | rg -F 'app-indicator'

org.gnome.shell enabled-extensions ['tiling-assistant@leleat-on-github', 'desktop-icons@csoriano', 'panelScroll@sun.wxg@gmail.com', 'touchpad-indicator@orangeshirt', 'gestureImprovements@gestures', 'workspace-switch-wraparound@theychx.org', 'multi-monitors-add-on@spin83', 'impatience@gfxmonk.net', 'trayIconsReloaded@selfmade.pl', 'babar@fthx', 'ubuntu-dock@ubuntu.com', 'walkpaper@walkpaper.blinkbp.github.com', 'user-theme@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com', 'sound-output-device-chooser@kgshank.net', 'caffeine@patapon.info', 'cpupower@mko-sl.de', 'horizontal-workspace-indicator@tty2.io']
```

### Integration with Chrome

Error on site:

> Although GNOME Shell integration extension is running, native host connector is not detected. Refer documentation for instructions about installing connector.

Fix:

Run `sudo apt chrome-gnome-shell`

### Extension fails to load after update

Look for errors in the syslog (`rg $EXTENSION_NAME /var/log/syslog`).

If the error reads

> Error: A different version was loaded previously

then you need to [restart the GNOME shell](#restart-gnome-shell) and then restart **Extension Manager**.

## Keybindings

### "Select All" shortcut

`Ctrl-/` is a secondary shortcut for "Select All", and works even when using [[emacs]] keybindings.

### List keybindings

```bash
(for schema in $(gsettings list-schemas); do gsettings list-recursively $schema; done) | rg 'keybindings'
```

Useful if you're trying to figure out what is stopping you from settings a binding (`<Super>+o` being a notable
offender)

### Rebind keybindings

#### Multiple keybindings for an action

See [[gsettings]] notes

#### `<Super>+P` toggles display

If you use the keyboard shortcut `<Super>+p`, the GNOME keybindings UI won't tell you it's already bound to
`switch-monitor`, and using that binding will cause your external displays to freak out.

Use the [[gsettings]] command to unbind it:

```bash
# view keybinding
$ gsettings get org.gnome.mutter.keybindings switch-monitor
['<Super>p', 'XF86Display']

# unset keybinding
$ gsettings set org.gnome.mutter.keybindings switch-monitor "[]"

# view new binding
$ gsettings get org.gnome.mutter.keybindings switch-monitor     
@as []

```

#### unset SUPER+o

Unset the binding:

```bash
gsettings set org.gnome.settings-daemon.plugins.media-keys rotate-video-lock-static []
```

Then restart GNOME (`Super+F2`, then enter `r<Enter>`)

#### rebind SUPER+SHIFT+,

For some reason, the GNOME keybindings UI won't allow you t set athe shortcut `SUPER+SHIFT+,`

`gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Super><Shift>comma']"`

## Move Open/Save/Cancel modal buttons to bottom of dialogue

```bash
gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/DialogsUseHeader':<0>}"
```

## Can't set keybindings in GUI

There's some issue that prevents setting some keybindings through the Settings app (for example, though it would
recognize `Super+Shift+,`, I couldn't get it to actually _set_ a shortcut to that binding.

To set these, use [[gsettings]] in the command line.

## Set text scaling factor

```bash
gsettings get org.gnome.desktop.interface text-scaling-factor

gsettings set org.gnome.desktop.interface text-scaling-factor <SCALING_FACTOR>
```

## Set step size for volume increment/decrement

```bash
$ gsettings get org.gnome.settings-daemon.plugins.media-keys volume-step
6

$ gsettings set org.gnome.settings-daemon.plugins.media-keys volume-step 2
```
