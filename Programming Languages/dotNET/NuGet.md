# NuGet

## Restrict project version

```xml
<!-- Pin to highest available 7.x version -->
<PackageReference Include="FluentAssertions" Version="7.1.0" AllowedVersions="7.x" />
```

## CLI

_reference_: <https://docs.microsoft.com/en-us/nuget/reference/cli-reference/cli-ref-list>

### List packages in the project

In the project folder (where the `nuget.config` file is), run the command

```bash
nuget list -ConfigFile nuget.config -PreRelease
```

### List all versions of a specific package

```bash
nuget list $PACKAGE_NAME -ConfigFile nuget.config -PreRelease -AllVersions
```
