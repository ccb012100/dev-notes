# Keychron

## Setting up a Keychron K4 Pro

### Clone repo

**Keychron** maintain their own [fork](https://github.com/Keychron/qmk_firmware/) of `qmk_firmware`; it contains support for keyboards that haven't been added to the main QMK project.

Clone the fork:

```bash
gh repo clone Keychron/qmk_firmware`
```

Switch to the `bluetooth_playground` branch:

- `$ git checkout bluetooth_playground`

### Install/setup QMK

Install QMK:

- `python3.11 -m pip install --upgrade pip`

Set up QMK:

- `$ qmk setup`

If on Windows/WSL, install [QMK Toolbox](https://github.com/qmk/qmk_toolbox)

Configure the repo to be the default **qmk** project:

- `$ qmk config user.qmk_home=<repo_directory>`

Set the **Keychron K4 Pro** as the default keyboard and keymap:

  ```bash
  qmk config user.keyboard=keychron/k4_pro/ansi/rgb
  qmk config user.keyboard=default
  ```

### Modify keyboard configuration

- Modify keymaps/config/rules
  - The **K4 Pro**-specific code is in the directory `keyboards/keychron/k4_pro`

### Compile the keyboard firmware

Run `$ qmk compile -kb keychron/k4_pro/ansi/rgb -km default`

You can also run just `$ qmk compile`, but it must be run from the keymap folder (`keyboards/keychron/k4_pro/ansi/rgb/keymaps/default`).

### Flash the firmware to keyboard

Flashing via **QMK Toolbox** is the easiest method.

#### Flashing via the CLI:

Run `$ qmk flash -km keychron/k4_pro/ansi/rgb:default`

- Make sure the keyboard's USB-C cord is not connected to the computer.
  - (Was experiencing problems when you just unplug the keyboard but leave the USB-C cable connected to the computer, so it's safest to just unplug from the computer.)
- Remove the spacebar keycap from the keyboard to reveal the `RESET` button.
- Connect the keyboard to the computer while holding down the `RESET` button
  - Don't release the button until the CLI output indicates that it has discovered the keyboard.
- Wait for flashing to complete

_Note:_ After flashing, it may be necessary to remove the keyboard from the Bluetooth devices and re-pair them (at least
on Windows)

#### **QMK Toolbox** flashing issue

##### Problem

Selecting the _Auto-flash_ checkbox, the keyboard doesn't acutally flash. You can identify when it happens issue because
there should be output logging for the whole flashing process. In this scenario, it says it's staring flashing, and then
immediately prints that flashing is complete, with no intermediate output.

##### Solution

Leave the checkbox unchecked and flash manually with the button labeled _Flash_.
