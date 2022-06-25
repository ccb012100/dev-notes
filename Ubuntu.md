# Ubuntu [[Linux]]

## get version

```bash
lsb_release -a
```

## Enable [[Wayland]]

_Note: Wayland was made the default in Ubuntu 22.04, so this should only be necessary for earlier versions._

- Run the command `sudo /etc/gdm3/custom.conf` and uncomment the line `#WaylandEnable=true`
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
