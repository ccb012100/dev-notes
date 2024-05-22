# Karabiner-Elements

[Keyboard remapper](https://karabiner-elements.pqrs.org/) for **macOS**

## Can't activate driver

I encountered this after running a **macOS** update. The `★ Activate driver` button kept failing with the message `Activation was failed. (error:1)`.

I ran the command `log show --predicate 'sender == "sysextd" or sender CONTAINS "org.pqrs"' --info --debug --last 5m` and found this in the logs:

```log
2024-05-22 13:24:12.444547-0500 0x4c99d   Error  0x0  470   0   sysextd: bundle code signature is not valid - does not satisfy requirement: -67050 code failed to satisfy specified code requirement(s)
```

I was able to fix it by uninstalling **Karabiner-Elements**, restarting my **MacBook**, and then downloading and installing **Karabiner-Elements**.
