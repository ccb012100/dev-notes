# Ulauncher

Linux application launcher

<https://github.com/Ulauncher/Ulauncher>

## Mapping toogle to a shortcut that includes `<Super>`

_NOTE: this workaround is broken due to a [bug](https://github.com/Ulauncher/Ulauncher/issues/222) in the
`ulauncher-toggle` shortcut that opens the window without focus; for now, you just have to enter your shortcut twice to
activate Ulauncher._

Because the `<Super>` key is used to launch the overview in GNOME, it seems it somehow intercepts shortcuts using
`<Super>` alone (i.e. without any other modifiers):

<https://github.com/Ulauncher/Ulauncher/issues/405>

To get around this, create a _Custom Shortcut_ in _Settings_ -> _Keyboard Shortcuts_ and use the command `ulauncher-toggle`.

## Extensions

Useful extensions:

- [Uluancher windows switcher](https://github.com/merrickluo/ulauncher-windows-switcher)
- [ulauncher-vscode-recent](https://github.com/plibither8/ulauncher-vscode-recent)
- [ulauncher-terminal-runner-extension](https://github.com/lighttigerXIV/ulauncher-terminal-runner-extension/)
