# Windows

## Shortcuts

`Alt + Esc` - Cycle through items in the order in which they were opened, moving current window to back

`Alt + Enter` - Display properties for the selected item

`Alt + Spacebar` - Open the shortcut menu for the active window

`Alt + Left arrow` - Go back

`Alt + Right arrow` - Go forward

`Alt + Page Up` - Move up one screen

`Alt + Page Down` - Move down one screen

`Ctrl + Alt + Tab` - Use the arrow keys to switch between all open apps

`Ctrl + F4` - Close the active document (in apps that are full-screen and let you have multiple documents open at the same time)

`Ctrl + Esc` - **Start** menu

`Ctrl + Shift + Esc` - Open **Task manager**

`Ctrl + E` - Open Search (in most apps)

`Shift + F10` - context menu (right-click menu)

### `Win` key shortcuts

`Win + A` - **Quick Settings**

`Win + B` - Focus on first item in **Taskbar**

`Win + C` - **Teams** Chat

`Win + D` - Toggle display/hide **Desktop**

`Win + E` - **File Explorer**

`Win + I` - **Settings**

`Win + Alt + K` - Toggle microphone mute

`Win + L` - Lock computer

`Win + M` - Minimize all windows

`Win + N` - **Notification center**

`Win + P` - Set presentation display mode (duplicate, extend, etc.)

`Win + R` - **Run** dialog

`Win + S` - **Search**

`Win + Shift + S` - Screen snip

`Win + U` - **Accessibility** settings

`Win + V` - **Clipboard** history

`Win + X` - **Quick Link** menu

`Win + Z` - Snap layouts

`Win + .` - Emoji panel

`Win + ;` - Emoji panel

`Win + ,` - Peek at **Desktop**

`Win + [0-9]` - Open app in nth position on **taskbar**

`Win + Alt + [0-9]` - Open the **Jump List** for the app in nth position on **taskbar**

`Win + TAB` - **Task** view

`Win + <UpArrow>` - Maximize window

`Win + Home` - Minimize all except active window

`Win + Shift + [<LeftArrow>|<RightArrow>]` - Move window to left/right monitor (wraps around)

## Getting a window off screen back into view

- Hold down the `Shift` key while right-clicking the program in the taskbar
- Select `Move`
- Use the arrow keys to move the window over to the visible desktop

## Remap left `Caps Lock` to `Ctrl`

create file named `keys.reg`:

```reg
; Map Caps Lock to Ctrl
REGEDIT4
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00
```

## Windows `Startup` folder

Located at `C:\Users\<UserName>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

### Quick open `Startup` folder

1. `Win + R`
2. Enter `shell:startup` in Run window

## Environment variables

`%PATH%`

`%TEMP%`/`%TMP%`

`%HOMEPATH%`

## Windows Defender

### Symptom

When trying to change settings, get the messages **Some settings are managed by your organization** or **This setting is
managed by your administrator**

### Solution

1. Open **Registry Editor** (`regedit.exe`)
2. Go to `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender`
3. Export the `Windows Defender` branch.
4. Delete the `Windows Defender` branch.
5. Restart `explorer.exe`.

_source_: <https://www.winhelponline.com/blog/windows-defender-disabled-real-time-protection-virus/>

## customizating Windows 11

### Taskbar grouping

**WARNING**: this doesn't seem to work (as of 2023-05-30)

Open `regedit.exe` and navigate to `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced`

Edit `TaskbarGlomLevel`:

- `0` Always combine, hide labels (default)
- `1` Combine when taskbar is full/Show labels
- `2` Never combine/Show labels

### show all icons in Taskbar

**WARNING**: this doesn't seem to work (as of 2023-05-30)

1. Press `Win+R` to open the _Run_ prompt.
2. Enter `explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}`
3. Tick the _Always show all icons and notifications on the taskbar_ checkbox.
4. Click _OK_

[source](https://techcommunity.microsoft.com/t5/windows-11/quot-show-all-icons-in-system-tray-quot-option-in-windows11/m-p/3359877)

## Choppy/lagging Bluetooth mouse

### Symptom

After leaving the mouse idle for a few seconds, it will take a second or two for it to start responding to movement when it's next used

### Solution

- Open **Device Manager**
- Expand **Bluetooth**
- Double-click on **Intel(R) Wireless Bluetooth(R)**
- Click on the tab **Power Management**
- Unheck the box labeled _Allow the computer to turn off this device to save power_

_Source_: <https://www.reddit.com/r/Windows11/comments/tafgx3/if_youre_having_issues_with_a_laggystuttering/>

## Windows icon file locations

<https://www.digitalcitizen.life/where-find-most-windows-10s-native-icons/>

## Unable to unpin from Quick access in File Explorer

### Symptom

After choosing _unpin from Quick access_ in File Explorer, entries stay pinned.

### Solution

- Press `WIN + R` and enter `%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations`
- Delete all entries in the list (this will reset the Quick access section)

## Enable Hibernate

- open [[cmd.exe]] as Administrator and run `powercfg.exe \hibernate on`
- open **Control Panel** and go to `Control Panel\Hardware and Sound\Power Options\System Settings`
  - To be able to add Hibernate to the _Shutdown settings_, click the link _Change settings that are currently unavailable_

## Identify which process is locking a file

### **Resource Monitor**

- Open **Resource Monitor** using `Win+R`, `resmon`
- Go to the **CPU** tab
  - In the **Processes** section, check the box next to _Image_ to select all Processes
  - In the **Associated Handlers** section titlebar, enter the file name in the search box on the right 

### **Process Explorer**

- Download from <https://learn.microsoft.com/en-us/sysinternals/downloads/process-explorer>
- Go to **Find** > **Find Handle or DLL**
  - Type the file name in the _Handle or DLL substring:_ textbox
