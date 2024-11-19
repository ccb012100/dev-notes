# QMK

<https://qmk.fm/>

## Keychron

Setting up Keychron requires using their [fork](https://github.com/Keychron/qmk_firmware/) of QMK. See Keychron notes for details.

## Ergodox EZ

Use <https://github.com/ccb012100/qmk_firmware/tree/ergodox_ez>:

### Setup

```zsh
cd qmk_firmware
qmk setup
qmk config user.keyboard=ergodox_ez
qmk config user.keymap=ccb012100
```

### Flash keyboard

```zsh
qmk flash # also compiles the keymap
# press the RESET button on the keyboard
```

## Apple Fn key

_Fn_ key functionality doesn't work with **NKRO**, and you have to modify `VENDOR_ID` and `PRODUCT_ID` to spoof an Apple keyboard, so it's only
available as a [patch](https://gist.github.com/fauxpark/010dcf5d6377c3a71ac98ce37414c6c4).
