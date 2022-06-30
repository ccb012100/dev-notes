# logiops

[[Linux]] driver for Logitech mice/keyboards (to make up for no Logitech Options+ software on Linux)

[This article](https://danishshakeel.me/configure-logitech-mx-master-3-on-linux-logiops/) is really helpful for the
configuration file format.

## Build failures

If the build fails due to inability to find `libevdev`:

```bash
-- Found PkgConfig: /home/linuxbrew/.linuxbrew/bin/pkg-config (found version "0.29.2") 
-- Checking for module 'libevdev'
--   No package 'libevdev' found
```

Remove the `.linuxbrew` from `$PATH`, delte `CMakeCache.txt`, and run `cmake ..` again and it should work.

_source: <https://github.com/PixlOne/logiops/issues/142>_

## Get device name

Run the command `sudo logiops` with the device connected and the device name will be listed at startup.
