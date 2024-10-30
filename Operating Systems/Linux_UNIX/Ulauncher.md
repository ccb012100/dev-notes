# Ulauncher

Linux application launcher

<https://github.com/Ulauncher/Ulauncher>

## Running on Wayland

To use Ulauncher on Wayland, run `sudo apt install wmctrl` and create launcher for command `ulauncher-toggle` in
Wayland.

_([source](https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland))_

## Mapping toogle to a shortcut that includes `<Super>`

_NOTE: this workaround is broken due to a [bug](https://github.com/Ulauncher/Ulauncher/issues/222) in the
`ulauncher-toggle` shortcut that opens the window without focus; for now, you just have to enter your shortcut twice to
activate Ulauncher. But after learning about the Wayland fix above, I think installed `wmctrl` may be all that's needed_

Because the `<Super>` key is used to launch the overview in GNOME, it seems it somehow intercepts shortcuts using
`<Super>` alone (i.e. without any other modifiers):

<https://github.com/Ulauncher/Ulauncher/issues/405>

To get around this, create a _Custom Shortcut_ in _Settings_ -> _Keyboard Shortcuts_ and use the command `ulauncher-toggle`.

## Extensions

Useful extensions:

- [Uluancher windows switcher](https://github.com/merrickluo/ulauncher-windows-switcher)
- [ulauncher-vscode-recent](https://github.com/plibither8/ulauncher-vscode-recent)
- [ulauncher-terminal-runner-extension](https://github.com/lighttigerXIV/ulauncher-terminal-runner-extension/)
- [Ulauncher Github](https://github.com/brpaz/ulauncher-github)

### Installation error with Ulauncher Github

The Extension will fail because the `github` is not installed.

Run `pip install pygithub` (_not_ `pip install github`)

_([source](https://github.com/brpaz/ulauncher-github/issues/12))_
