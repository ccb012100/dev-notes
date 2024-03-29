# Ubuntu [[Linux]]

- [Ubuntu \[\[Linux\]\]](#ubuntu-linux)
  - [get version](#get-version)
  - [Release upgrade](#release-upgrade)
  - [Update to interim release](#update-to-interim-release)
  - [Enable \[\[Wayland\]\]](#enable-wayland)
  - [Get latest stable upstream \[\[Git\]\] version](#get-latest-stable-upstream-git-version)
  - [apt](#apt)
    - [commands](#commands)
  - [Manual apt repositories](#manual-apt-repositories)
    - [\[\[Postgres\]\]](#postgres)
    - [\[\[Docker\]\]](#docker)
    - [Repository does not have Release file](#repository-does-not-have-release-file)
      - [Problem](#problem)
      - [Solution](#solution)
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

## apt

**Advanced Package Tool** (**APT**)

Repository list is located in `/etc/apt/sources.list`

### commands

```bash
# "apt" or "apt-get"

apt update

apt upgrade

apt install $PACKAGE_NAME

apt search $PACKAGE_NAME
```

## Manual apt repositories

### [[Postgres]]

<https://wiki.postgresql.org/wiki/Apt>

### [[Docker]]

<https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository>

### Repository does not have Release file

#### Problem

When you run `sudo apt update`, you get an Error similar to the following:

> E: The repository '<https://ppa.launchpadcontent.net/wslutilities/wslu/ubuntu> mantic Release' does not have a Release file.
> N: Updating from such a repository can't be done securely, and is therefore disabled by default.
> N: See apt-secure(8) manpage for repository creation and user configuration details.

#### Solution

- Find the appropriate file in `/etc/apt/sources.list.d`.
- Open it with `sudoedit`.
- Replace the release version to a version that the source does have a Release file for.

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
