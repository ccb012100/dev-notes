# Ubuntu [[Linux]]

- [Ubuntu \[\[Linux\]\]](#ubuntu-linux)
  - [get version](#get-version)
  - [Release upgrade](#release-upgrade)
  - [Update to interim release](#update-to-interim-release)
  - [Enable \[\[Wayland\]\]](#enable-wayland)
  - [Get latest stable upstream \[\[Git\]\] version](#get-latest-stable-upstream-git-version)
  - [Change default terminal](#change-default-terminal)
  - [Show number overlays on GNOME dock](#show-number-overlays-on-gnome-dock)
  - [free up Control+Shift+E shortcut](#free-up-controlshifte-shortcut)
  - [Disable/modify settings for Automatic Updates](#disablemodify-settings-for-automatic-updates)
  - [Set default Editor](#set-default-editor)
    - [Install editor as alternative](#install-editor-as-alternative)
    - [Configure alternative](#configure-alternative)
  - [Set \[\[homebrew\]\] \[\[Zsh\]\] as default shell](#set-homebrew-zsh-as-default-shell)

## get version

```bash
lsb_release -a
```

## Release upgrade

`sudo apt update && sudo do-release-upgrade`

## Update to interim release

Run `sudoedit /etc/update-manager/release-upgrades` and change `Prompt=lts` to `Prompt=normal`

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

## Disable/modify settings for Automatic Updates

<https://linuxnightly.com/how-to-disable-automatic-updates-in-ubuntu/>

## Set default Editor

Use the `update-alternatives` command.

### Install editor as alternative

`update-alternatives --install /usr/bin/editor editor <editor_to_install> <priority>`

e.g.

`update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100`

### Configure alternative

`update-alternatives --config editor`

_NOTE_: If `update-alternatives` is using 'auto mode', then it will choose the highest priority as the default editor, so
setting  high priority will make the newly installed editor

## Set [[homebrew]] [[Zsh]] as default shell

```bash
# install zsh
brew install zsh
# add homebrew zsh to /etc/shells
sudoedit /etc/shells # add /home/linuxbrew/.linuxbrew/bin/zsh to the file
# set default shell
chsh /home/linuxbrew/.linuxbrew/bin/zsh
# remove apt version
sudo apt remove zsh
# create link for /usr/bin/zsh b/c a lot of things will break if there's no zsh there
sudo ln -s /home/linuxbrew/.linuxbrew/bin/zsh /usr/bin/zsh
```
