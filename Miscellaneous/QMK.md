# QMK

<https://qmk.fm/>

## Keychron

Setting up Keychron requires using their [fork](https://github.com/Keychron/qmk_firmware/) of QMK. See Keychron notes for details.

## Ergodox EZ

Use <https://github.com/ccb012100/qmk_firmware/tree/ergodox_ez>:

```zsh
cd qmk_firmware
qmk setup
qmk compile -kb ergodox_ez -km rgb_layer
```
