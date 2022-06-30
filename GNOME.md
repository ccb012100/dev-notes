# GNOME

Desktop Environment (DE) for [[Linux]]. Used by [[Ubuntu]]

## Add top bar to all monitors

Use [Multi Monitors Add-On](https://github.com/realh/multi-monitors-add-on)

## Restart GNOME Shell

Open Task Runner and run command `r`

On [[Wayland]], you have to run terminal command `killall -3 gnome-shell`

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
