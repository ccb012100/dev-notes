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
