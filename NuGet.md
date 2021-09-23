# NuGet

## CLI

### List packages in the project

In the project folder (where the `nuget.config` file is), run the command

```bash
nuget list -ConfigFile nuget.config -PreRelease
```

### List all versions of a specific package

```bash
nuget list $PACKAGE_NAME -ConfigFile nuget.config -PreRelease
```
