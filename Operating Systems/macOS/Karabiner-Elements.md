# Karabiner-Elements

[Keyboard remapper](https://karabiner-elements.pqrs.org/) for **macOS**

## Uninstalling

If installed via **Homebrew**:

- use `brew remove karabiner-elements`

If installed manually:

- From within Karabiner-Elements, go to the **Uninstall** tab and click `Launch uninstaller`

## Can't activate driver

I encountered this after running a macOS update. The `★ Activate driver` button kept failing with the message `Activation was failed. (error:1)`.

I ran the command `log show --predicate 'sender == "sysextd" or sender CONTAINS "org.pqrs"' --info --debug --last 5m` (can also look at the **Log**
tab within Karabiner-Elements itself) and found this in the logs:

```log
2024-05-22 13:24:12.444547-0500 0x4c99d   Error  0x0  470   0   sysextd: bundle code signature is not valid - does not satisfy requirement: -67050 code failed to satisfy specified code requirement(s)
```

I was able to fix it by uninstalling Karabiner-Elements (see the section [above](#uninstalling)), restarting my MacBook, and then downloading and
installing Karabiner-Elements.

## Outdated driver

When you open Karabiner-Elements, it displays a modal with the text:

> 💡 macOS restart required
>
> The current virtual keyboard and mouse driver is outdated. **Please restart macOS to upgrade the driver.

![outdated driver warning](/images/karabiner-elements_outdated_driver.png)

The **Log** tab will show something similar to:

```log
[2024-11-01 09:32:53.396] [info] [virtual_hid_device_service] io_service_client::opened
[2024-11-01 09:32:53.396] [info] [virtual_hid_device_service] io_service_client::async_virtual_hid_keyboard_initialize
[2024-11-01 09:32:53.396] [warning] [virtual_hid_device_service] driver_version_ is mismatched: Karabiner-VirtualHIDDevice-Daemon expected: 10800, actual dext: 10700
[2024-11-01 09:32:53.396] [error] [virtual_hid_device_service] virtual_hid_keyboard_initialize error: kIOReturnError
```

I'm still not sure how I resolved this, but what _seemed_ to work:

1. Uninstall Karabiner-Elements
2. Remove all Karabiner entries from **System Settings** ➤ **Privacy & Security**
3. Install Karabiner-Elements
4. Restart my MacBook

**NOTE:** I also deleted `$HOME/.config/karabiner/karabiner.json`, but I don't think that was necessary...

## Modifiers

### `from.modifiers`

Omitting `from.modifiers` from a manipulator definition is functionally the _opposite_ of setting `modifiers.optional` to `any`, i.e. the manipulator will
only trigger if no modifiers are held down.

The modifiers in `from.modifiers.mandatory` are _not_ passed through to the mapping; Any modifiers specified `from.modifiers.optional` _are_ passed through if they're held when the manipulator is triggered.

<https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/from/modifiers/>

## Hold down multiple non-modifier keys

Use `from.simultaneous`.

Example:

```json
// launch Mission Control when pressing a,s,d simultaneously
{
    "type": "basic",
    "from": {
        "simultaneous": [
            { "key_code": "a" },
            { "key_code": "s" },
            { "key_code": "d" }
        ],
        "modifiers": { "optional": ["any"] }
    },
    "to": [ { "key_code": "mission_control" }
    ]
}
```

([source](https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/from/simultaneous/))

## Simulating layers

- Create a manipulator that sets a variable `foo` with
  [`to.set_variable`](https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/to/set-variable/) to activate the
  layer when a certain key/combo is held down.
- For a given keycombo, add a
  [`variable_if`](https://karabiner-elements.pqrs.org/docs/json/complex-modifications-manipulator-definition/conditions/variable/) entry in the
  `conditions` array that checks the value for the variable `foo` set in the previous manipulator.

Example:

```json
[
    {
        "type": "basic",
        "from": {
            "key_code": "keypad_1",
            "modifiers": {
                "mandatory": [],
                "optional": ["any"]
            }
        },
        "to": [
            {
                "set_variable": {
                    "name": "my_modifier_1",
                    "value": 1
                }
            }
        ],
        "to_after_key_up": [
            {
                "set_variable": {
                    "name": "my_modifier_1",
                    "value": 0
                }
            }
        ]
    },

    {
        "type": "basic",
        "from": {
            "key_code": "a",
            "modifiers": {
                "mandatory": [],
                "optional": ["any"]
            }
        },
        "to": [ { "key_code": "mission_control" }
        ],
        "conditions": [
            {
                "type": "variable_if",
                "name": "my_modifier_1",
                "value": 1
            }
        ]
    },

    {
        "type": "basic",
        "from": {
            "key_code": "s",
            "modifiers": {
                "mandatory": [],
                "optional": ["any"]
            }
        },
        "to": [ { "key_code": "launchpad" }
        ],
        "conditions": [
            {
                "type": "variable_if",
                "name": "my_modifier_1",
                "value": 1
            }
        ]
    }
]
```
