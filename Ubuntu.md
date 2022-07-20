# Ubuntu [[Linux]]

- [Ubuntu [[Linux]]](#ubuntu-linux)
  - [get version](#get-version)
  - [Enable [[Wayland]]](#enable-wayland)
  - [Get latest stable upstream [[Git]] version](#get-latest-stable-upstream-git-version)
  - [Change default terminal](#change-default-terminal)
  - [Show number overlays on GNOME dock](#show-number-overlays-on-gnome-dock)
  - [free up Control+Shift+E shortcut](#free-up-controlshifte-shortcut)

## get version

```bash
lsb_release -a
```

## Enable [[Wayland]]

_Note: Wayland was made the default in Ubuntu 22.04, so this should only be necessary for earlier versions._

- Run the command `sudo vim /etc/gdm3/custom.conf` and uncomment the line `#WaylandEnable=true`
- Change it to `WaylandEnable=false` to disable [[Wayland]].
- Run the command `sudo systemctl restart gdm3`

## Get latest stable upstream [[Git]] version

```bash
sudo add-apt-repository ppa:git-core/ppa && sudo apt update && sudo apt install git
```

## Change default terminal

_source: <https://itsfoss.com/change-default-terminal-ubuntu/>_

Run the command `sudo update-alternatives --config x-terminal-emulator`.

## Show number overlays on GNOME dock

`Super+q`

## free up Control+Shift+E shortcut

Trying to map `Ctrl+Shift+E` to a command in [[vscode]], it will show up as `Unknown`. This is because Linux has the
shortcut bound globally to Emoji input.

To fix it, run the command `ibus-setup`, go to the _Emoji Input_ tab, and delete the `Control+Shift+E` shortcut.

_source: <https://github.com/microsoft/vscode/issues/72947#issuecomment-491228367>_

According to <https://stackoverflow.com/a/52295258>, this is only an issue in `GTK3` versions before `3.24`.

## [[GNOME]] keybindings

There's some issue that prevents setting some keybindings through the Settings app (for example, though it would
recognize `Super+Shift+,`, I couldn't get it to actually _set_ a shortcut to that binding.

To set these, use [[gsettings]] in the command line.

## Disable/modify settings for Automatic Updates

<https://linuxnightly.com/how-to-disable-automatic-updates-in-ubuntu/>
