# Visual Studio

- Location of `CurrentSettings.vssettings`
  - `%UserProfile%\AppData\Local\Microsoft\VisualStudio\15.0_*\Settings`

## Resharper

- settings file is located at `%AppData%\JetBrains\Shared\vAny\GlobalSettingsStorage.DotSettings`

## [[Git]] hooks

### Symptom

Trying to create a commit fails with the error:

> `/bin/bash: <HOOK_LOCATION>/pre-commit: No such file or directory`

### Solution

Change the shebang to `#!/usr/sh`
