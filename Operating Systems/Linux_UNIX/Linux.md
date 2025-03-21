# Linux

## Display formatted `$PATH`

### **sed**

```bash
# sed
sed 's/:/\n/g' <<< "$PATH"

#tr
tr ':' '\n' <<< "$PATH" # tr

# python
python2 -c "import os; print os.environ['PATH'].replace(':', '\n')"

# bash parameter substition
echo "${PATH//:/$'\n'}"
```

## Set default shell to Zsh

```bash
chsh -s $(which zsh)
```

## Benchmarking shell startup time

```bash
# run and exit
$ hyperfine --shell=none "fish --command=exit"
Benchmark 1: fish -c exit
  Time (mean ± σ):      17.9 ms ±   1.6 ms    [User: 4.5 ms, System: 3.4 ms]
  Range (min … max):    13.0 ms …  21.6 ms    150 runs
# run with no config
$ hyperfine --shell=none "fish --no-config --command=exit"
Benchmark 1: fish -n -c exit
  Time (mean ± σ):       5.9 ms ±   0.8 ms    [User: 1.4 ms, System: 1.0 ms]
  Range (min … max):     4.4 ms …   9.2 ms    418 runs
# run as login
$ hyperfine --shell=none "fish --login --command=exit"
Benchmark 1: fish --login --command=exit
  Time (mean ± σ):      19.2 ms ±   1.6 ms    [User: 5.1 ms, System: 3.6 ms]
  Range (min … max):    15.7 ms …  25.5 ms    140 runs
# run as interactive
$ hyperfine --shell=none "fish --interactive --command=exit"
Benchmark 1: fish --interactive --command=exit
  Time (mean ± σ):     455.7 ms ±  16.5 ms    [User: 327.7 ms, System: 35.9 ms]
  Range (min … max):   427.8 ms … 484.1 ms    10 runs
```

([source](https://tratt.net/laurie/blog/2024/faster_shell_startup_with_shell_switching.html))

## display system info using `inxi`

```bash
inxi -Frmxx
```

### z - jump around

modify .zshrc [to fix error](https://github.com/rupa/z/issues/230#issuecomment-362297213): `_z_precmd:1: nice(5) failed: operation not permitted`

## Nano

### switches

- **`-B`** backs up the file prior to editing it
- **`-E`** converts tabs to spaces when editing
- **`-c`** constantly show the cursor position stats
- **`-i`** automatically indents new lines to the same position as the previous line
- **`-k`** toggle cut so that it cuts from cursor position instead of the whole line
- **`-m`** provides mouse support to the editor
- **`-v`** opens file as readonly

### nanorc

run `nano -V` to check if `--enable-nanorc option` is present

apply settings to

- all users:
  - copy `nanorc` to `/etc/nanorc`
- a single user:
  - copy `nanorc` to `$HOME/.nanorc`

## get line count of all code files in a repository

```bash
find */** -type f \( -iname \*.cs -o -iname \*.js -iname \*.ts -name \*.cshtml \) -print0 \
| xargs -0 wc -l \
| grep -v 'total$' \
| sort -nr > ca_line_counts.txt
```

- `-type f` - files only (exlude directories and symbolic links)
- `-iname \*.cs` - files with name matching the pattern `*.cs`
- `-o` - OR
- `print0` - from `find` man page: "print the full file name on the standard output, followed by a null character (instead of
  the newline character that -print uses). This allows file names that contain newlines or other types of white space to be correctly interpreted by programs process the find output. This option corresponds to the -0 option of xargs."
- `xargs -0` - From the `xargs` man page: "Change `xargs` to expect NUL (`\0`) characters as separators, instead of spaces and newlines. This is expected to be used in concert with the `-print0` function in `find(1)`."
- `sort -n` - numeric sort
- `sort -r` - reverse sort

## find a file and print the contents

```bash
find -name $FILE_NAME -exec cat {} \;
```

## Utilities

### inspect system resources

#### process info

`top`, `htop`

#### uname

Print operating system info.

`uname -a`

#### /proc

The `/proc` directory contains files with hardware info.

ex. `cat /proc/cpuinfo`

### List all environment variables

`printenv` or `set`

### Get process ID

#### `pidof`

e.g.

```bash
pidof slack
```

#### `ps`

`ps aux | grep -i "PROGRAM_NAME"`

Type `pidof<TAB>` to get autocompletion of application names.

### Kill process

```bash
sudo kill -9 PROCESS_ID

sudo kill -9 `pidof PROGRAM_NAME`

killall PROGRAM_NAME
```

### Get USB device info

`lsusb`

### `proc`

Every process has an entry in the `/proc` directory. A process can be located by it's PID at `/proc/PID`.

| file | description |
| - | - |
| `/prod/PID/cmdline` | command line arguments the process was started with |
| `/prod/PID/exe` | symlink to the process' binary |
| `/prod/PID/environ` | the process' environment variables |
| `/prod/PID/status` | sleep/wake state, memory usage, etc. |
| `/prod/PID/fd` | directory containing every file the process has open |
| `/prod/PID/stack` | kernel's current stack for the process |
| `/prod/PID/maps` | list of the process' memory maps (shared libraries, heap, anonymous maps, etc.) |

([source](https://wizardzines.com/comics/proc))

### `ldd`

`ldd` prints the shared objects (shared libraries) required by each program or shared object specified on the command line.

```bash
ldd BINARY

# exaple
ldd /bin/ls
```

([source](https://wizardzines.com/comics/shared-libraries))

## enable/disable Bluetooth on boot

- Run command `sudo vim /etc/bluetotth/main.conf`
- Change the line `AutoEnable=false` to `AutoEnable=true`

## Add/remove fonts

Fonts are located in `/usr/share/fonts` and `~/.local/share/fonts`.

After adding or removing fonts, run command `fc-cache -f` to update your font cache.

## Enable waking laptop with USB devices

- Run the command `rg . /sys/bus/usb/devices/*/product` to list names of all the USB devices

e.g. in this example my keyboard is device `3-1.1.4.1`:

```bash
❯ rg . /sys/bus/usb/devices/*/product
/sys/bus/usb/devices/usb3/product
1:xHCI Host Controller

/sys/bus/usb/devices/3-1.1/product
1:USB2.0 Hub

/sys/bus/usb/devices/3-1.1.4/product
1:4-Port USB 2.0 Hub

/sys/bus/usb/devices/3-1/product
1:USB2.0 Hub

/sys/bus/usb/devices/3-1.1.4.3/product
1:YubiKey OTP+FIDO+CCID

/sys/bus/usb/devices/3-1.1.2/product
1:AX88772A

/sys/bus/usb/devices/3-1.1.3/product
1:Jabra SPEAK 410 USB

/sys/bus/usb/devices/3-1.1.4.1/product
1:ErgoDox EZ Glow
```

- Using the name of that device, edit `/etc/rc.local` and add the line:

 `echo enabled > /sys/bus/usb/devices/$DEVICE_NAME/power/wakeup`

e.g. `echo enabled > /sys/bus/usb/devices/3-1.1.4.1/power/wakeup`

It should now enable the device on boot.

_([source](https://askubuntu.com/questions/848698/wake-up-from-suspend-using-wireless-usb-keyboard-or-mouse-for-any-linux-distro/874701#874701))

## set display brightness

```bash
xrandr --output <DISPLAY_NAME> --brightness <PERCENTAGE>
```

ex.

```bash
xrandr --output DP-1 --brightness 0.75
```

## rename files

Use the `rename` utility

```bash
rename EXPRESSION REPLACEMENT FILE

# change extension of files from .txt to .md
rename .txt .md *.md
```

## Get Linux kernel version

- `uname -r`
- `cat /proc/version`
- `hostnamectl`

## Audio issues

### Sound only coming from a single channel

Install [[Pulse Audio Volume Control]] (`pavucontrol`) and in the **Output devices** section, click the lock icon next to a device to see the individual levels for the 2 channels

### Use LDAC

Install PipeWire and the LDAC codec ([instructions](https://gist.github.com/the-spyke/2de98b22ff4f978ebf0650c90e82027e))

### Can't adjust system volume

#### Syptom

Adjusting the system volume has no effect (other than just having 2 levels: off (when the volume is set to 0) or 100% (when the volume is set to anything > 0))

#### Solution

- `sudoedit /usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf.common`
- Before the line `[Element PCM]`, add the text:

```conf
[Element Master]
switch = mute
volume = ignore
```

- restart audio service
  - [[Pulse Audio]]
    - `pulseaudio -k`
  - PipeWire
    - `systemctl --user restart pipewire pipewire-pulse`

[source](https://askubuntu.com/a/1022363)

### Mic keeps auto-muting after unmuting

This is due to a problem with the jack-sensing feature

#### Solution

- Run `sudoedit /etc/pulse/default.pa`
- Comment out the line `load-module module-switch-on-port-available`

([source](https://bbs.archlinux.org/viewtopic.php?id=247538))

## man page sections

| Section | Description                                                           |
|---------|-----------------------------------------------------------------------|
| 1       | User commands                                                         |
| 2       | Kernel system calls                                                   |
| 3       | Higher-level Unix programming library documentation                   |
| 4       | Device interface and driver information                               |
| 5       | File descriptions (system configuration files)                        |
| 6       | Games                                                                 |
| 7       | File formats, conventions, and encodings (ASCII, suffixes, and so on) |
| 8       | System commands and servers                                           |

## Symbolic links

### Get the target of a symbolic link

- `readlink SYMLINK`
- `realpath SYMLINK`
- `file SYMLINK`
- `stat -c%N SYMLINK`

## Search path for manpages

Run the command `manpath` to display the search path for manual pages

## `CDPATH`

Environment variable that acts as `cd`'s equivalent to `PATH`.

When set, `CDPATH` is the only context used, so be sure to add `.` (the current directory) to the front of the list, e.g.

```bash
export CDPATH=".:$HOME:$HOME/src"
```
