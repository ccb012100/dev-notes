# Keychron

## Setting up a Keychron K4 Pro

Clone the Keychron `qmk_firmware` [fork](https://github.com/Keychron/qmk_firmware/)

- `$ gh repo clone Keychron/qmk_firmware`

Switch to the `bluetooth_playground` branch

- `$ git checkout bluetooth_playground`

Set up QMK

- `$ qmk setup`

Set the repo to the default QMK project

- `$ qmk config user.qmk_home=<repo_directory>`

Set the default keyboard and keymap

- `$ qmk config user.keyboard=keychron/k4_pro/ansi/rgb`
- `$ qmk config user.keyboard=default`

Modify keymaps/config/rules

- The **K4 Pro**-specific code is in the directory `keyboards/keychron/k4_pro`

Compile the firmware

- `$ qmk compile` (uses defaults)
- `$ qmk compile -kb keychron/k4_pro/ansi/rgb -km default` (specify kb/keymap)

Flash the firmware to keyboard

- `$ qmk flash keychron/k4_pro/ansi/rgb:default`
- Make sure the keyboard's USB-C cord is not connected to the computer.
- Remove the spacebar keycap from the keyboard to reveal the `RESET` button.
- Connect the keyboard to the computer while holding down the `RESET` button; don't release the button until the CLI output indicates that it has discovered the keyboard.
- Wait for flashing to complete
