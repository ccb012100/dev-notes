# JetBrains Rider

## Switch focus from search box to editor

### macOS

```console
⌘+Enter
```

### Windows/Linux

```console
Ctrl+Enter
```

## Settings Repository

### git configuration

### Windows

Rider sets up its own git repository in AppData to sync settings changes.

To set the username and email, you need to change the `./git/config` file in that repo.

On Windows, it's located at `~/AppData/Roaming/JetBrains/Rider2021.2/settingsRepository/repository/.git/config`.

_Note_: when updating `recentSolutions.xml`, make sure that the IDE is closed and no processes are running

## Recent Items list

### Windows

For some reason, the Recent Items list can start showing the directory name instead of the project name.

To fix it, open `~/AppData/Roaming/JetBrains/Rider2021.2/options/recentSolutions.xml` and add a `displayName=""`
attribute to the `<RecentProjectMetaInfo>` tag for the projects showing up incorrectly.

## Projects open in window larger than screen size

### Windows

This seems to be because of using monitors with different resolutions (i.e. laptop monitor and external monitor).

To fix it (on Windows), open `~/AppData/Roaming/JetBrains/Rider2021.2/options/recentSolutions.xml` and edit the `<frame>` attribute
that looks like the following:

```xml
<frame x="2958" y="-8" width="2560" height="1400" />
```
