# Kitty terminal emulator

## Comments in `kitty.conf`

> [!IMPORTANT] Comments MUST BE ON SEPERATE LINES
> Comments can be added to the config file as lines starting with the `#`
> character. This works only if the `#` character is the FIRST
> character in the line.

## Get keyboard escape codes

```bash
kitten show_key
```

## [[Linux]]

### Add desktop entry to run from Launcher

<https://github.com/kovidgoyal/kitty/issues/347#issuecomment-1001063151>

> - Use the official install script, or download the latest release tarball from GitHub Releases.
>
> - Copy `kitty.desktop` to `~/.local/share/applications/`
>
> - Option 1: Edit `kitty.desktop`
>
>   - Change `TryExec`, `Exec` to `/your/absolute/path/to/kitty.app/bin/kitty`
>   - Change `Icon` to `/your/absolute/path/to/kitty.app/share/icons/hicolor/256x256/apps/kitty.png`
>
> - Option 2:
>
>   - Create a symlink in `PATH` for `kitty`.
>   - Copy `icons/hicolor/256x256/apps/kitty.png` under `kitty.app/share/` to `~/.local/share/<keep_the_same_path>`.
>
> - The kitty icon will appear in the launcher and can be run by clicking on it.

To use a single instance, create a script `~/kitty.sh`:

```sh
#!/usr/bin/env sh
/absolute/path/to/kitty.app/bin/kitty --single-instance
```

and in `kitty.desktop`, point `Exec`/`TryExec` to the script instead.

### Set as default terminal

```bash
# add to list of alternatives
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50

sudo update-alternatives --config x-terminal-emulator
```
