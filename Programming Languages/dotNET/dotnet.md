# dotnet

## Configuration

### View applied configuration

Use [ConfigurationRootExtensions.GetDebugView()](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.configurationrootextensions.getdebugview?view=net-8.0)

```c#
var configRoot = (IConfigurationRoot)configuration;
var debugView = configRoot.GetDebugView();
Console.WriteLine(debugView);
```

## App secrets

[Safe storage of app secrets in development in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-5.0&tabs=windows)

### Directory location

macOS

`${HOME}\.microsoft\usersecrets\`

Windows

`C:\Users\$user_name\AppData\Roaming\Microsoft\UserSecrets\`

### Add secrets to project

Add UserSecretsId to project

- `dotnet user-secrets init` (in project directory)

#### Option 1: Load from a JSON file

1. Put the secrets into the file `input.json`

2. In the project directory, run `cat ./input.json | dotnet user-secrets set`

#### Option 2: Using Secret Manager tool

Run all commands from the project directory:

##### Set secret

```bash
dotnet user-secrets set "$KEY" "$VALUE"
```

###### Nested properties

Nested properties are separated by a single `:`, not double (`::`)

```bash
# WRONG
dotnet user-secrets set Database::ConnectionString "foo"

# CORRECT
dotnet user-secrets set Database:ConnectionString "foo"
```

##### Remove secret

```bash
dotnet user-secrets remove "$KEY"
```

##### List secrets

```bash
dotnet user-secrets list
```

##### Clear all secrets

```bash
dotnet user-secrets clear
```

#### Option 3: Editing secrets file directly

Edit file at `$user_secrets_directory\$user_secrets_id\secret.json`

## MVC

### Razor templates

### View compilation

To conditionally enable runtime compilation, see [this doc](https://learn.microsoft.com/en-us/aspnet/core/mvc/views/view-compilation?tabs=visual-studio#enable-runtime-compilation-for-all-environments).

## NuGet

```bash
# add or update a package reference
dotnet add package $package_name

# add a package reference to a specific version of a package
dotnet add package $package_name --version $version

# list the package references for project
dotnet list package

# remove a package reference
dotnet remove package $package_name

# restore packages listed in the project file
# (done automatically as part of 'dotnet build' and 'dotnet run')
dotnet restore

# clear local NuGet cache
dotnet nuget locals all -c
```

### dotnet-outdated-tool

```bash
dotnet tool install --global dotnet-outdated-tool

dotnet outdated --upgrade
```

## System.Text.Json

### Pretty-print an object

```csharp
Console.WriteLine("Dto: " + JsonSerializer.Serialize(invoiceDto, new JsonSerializerOptions {WriteIndented = true}));
```

## XUnit

### Print a message to the test output window

```csharp
public class TestClass
{
  private readonly ITestOutputHelper _testOutputHelper;

  // ctor
  public void TestClass(ITestOutputHelper testOutputHelper)
  {
    _testOutputHelper = testOutputHelper;
  }

  // unit test
  [Fact]
  public void Test()
  {
    _testOutputHelper.WriteLine("Hello world!");
  }
}
```

## Test Shims

### Pose package

<https://github.com/tonerdo/pose>

```bash
dotnet add package Pose
```

#### Usage

```csharp
// Shim DateTime.UtcNow
PoseContext.Isolate(() =>
{
    Shim dateTimeShim = Shim
      .Replace(() => DateTime.UtcNow)
      .With(() => new DateTime(2025, 2, 3));

    DateTime result = DateTime.UtcNow;

    result.Should().Be(new DateTime(2025, 2, 3));
});
```

## Testing

### `HttpContext` in a `Controller`

```cs
_sut.ControllerContext = new ControllerContext { HttpContext = new DefaultHttpContext() };

_sut.ControllerContext.HttpContext.Items.Add("Foo", "bar");
```

## Log HTTP requests and responses

[Microsoft.AspNetCore.Builder.UseHttpLogging](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.builder.httploggingbuilderextensions.usehttplogging)

[HTTP Logging in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/http-logging)

## Docker

```bash
$ docker pull mcr.microsoft.com/dotnet/samples:aspnetapp

$ docker run --rm -it \
    -p 8000:80 -p 8001:443 \
    -e ASPNETCORE_URLS="https://+;http://+" \
    -e ASPNETCORE_HTTPS_PORT=8001 \
    -e ASPNETCORE_Kestrel__Certificates__Default__Password="<CREDENTIAL_PLACEHOLDER>" \
    -e d \
    -v %USERPROFILE%\.aspnet\https:/https/ mcr.microsoft.com/dotnet/samples:aspnetapp
```

### Trust dev HTTPS Certificates in Docker containers running in WSL with Docker Compose

In Windows, run:

  ```bash
  dotnet dev-certs https -ep ~/aspnetapp.pfx -p pass123 --trust
  ```

This will create the file `~/aspnetapp.pfx` with password = `pass123`

In WSL, run:

  ```bash
  sudo cp /mnt/c/Users/<USER>/https.pfx --password pass123 ~/.aspnet/https/aspnetapp.pfx
  ```

Create a `docker-compose.yml` file:

```yaml
services:
  api:
    build: .
    ports:
      - 80
      - 443
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - ASPNETCORE_URLS=https://+:443;http://+:80
      - ASPNETCORE_Kestrel__Certificates__Default__Password=password
      - ASPNETCORE_Kestrel__Certificates__Default__Path=/https/aspnetapp.pfx
    volumes:
      - ~/.aspnet/https:/https:ro
```

---

_sources_:

[Starting a container with https support using docker compose](https://learn.microsoft.com/en-us/aspnet/core/security/docker-compose-https?view=aspnetcore-6.0#starting-a-container-with-https-support-using-docker-compose)

[Trust HTTPS certificate from Windows Subsystem for Linux]( https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-7.0&tabs=visual-studio%2Clinux-ubuntu#trust-https-certificate-from-windows-subsystem-for-linux)

## Install on Ubuntu

I keep having issues where the latest version isn't in the `apt` repo, so just follow
[the instructions](https://learn.microsoft.com/en-Us/dotnet/core/install/linux-package-mixup?pivots=os-linux-other#i-need-a-version-of-net-that-isnt-provided-by-my-linux-distribution)
to use Microsoft's repository.

## SQLite

### In-memory database

The `ConnectionString` will follow the same format as that listed in the [SQLite documentation](https://www.sqlite.org/draft/inmemorydb.html), prepended with `DataSource=`, e.g.:

```json
{
    "ConnectionString": "DataSource=file::memory:?cache=shared"
}
```

## Integration Testing

### House test appsettings.json in the test project

1. In the integration test project, create the appsettings file for the `Environment` used in the tests, e.g. `appsettings.Test.json`.
1. In the test project's `.csproj` file, set the appsettings file to be copied with the build:

    ```xml
    <ItemGroup>
      <None Include="appsettings.Test.json" CopyToOutputDirectory="PreserveNewest"/>
    </ItemGroup>
    ```

1. In your custom `WebApplicationFactory`, apply the appsettings file in the `ConfigureWebHost` override:

    ```csharp
    protected override void ConfigureWebHost( IWebHostBuilder builder ) {
        // Apply config from appsettings.Integration.json
        builder.ConfigureAppConfiguration(
            ( webHostBuilderContext , configBuilder ) => {
                configBuilder.AddJsonFile(
                    Path.Combine(
                        Directory.GetCurrentDirectory( ),
                        "appsettings.Integration.json"
                    )
                );
            }
        );
    ```

1. If you want to use a **SQLite** in-memory database, you'll want to set a unique `ConnectionString` in `ConfigureWebHost` so that different tests run in parallel don't use the same connection:

    ```csharp
    protected override void ConfigureWebHost( IWebHostBuilder builder ) {
        /* 
         * This is applied _before_ Program.Main, which allows us to override
         * `appsettings.json` before Services are configured.
         */
        builder.UseConfiguration( configuration );
    }
    ```

## `dotnet-format`

### format only changed files

```bash
❯ dotnet-format --files $(git diff --name-only | tr '\n' ' ')
```

## .env

[[.NET]] environments file

([source](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration))

### `dotnet-env` NuGet package

Use with [dotnet-env](https://github.com/tonerdo/dotnet-env) to override values in the `appsettings.{Environment}.json` files through use of a `.env` file.

`.env` takes precedence over the app settings files, and by adding `.env` in `.gitignore`, you can use `.env` to modify settings locally without running the risk of accidentally committing the changes.

### File Format

The file should be named `.env` and placed in the project folder for the project that is being run.

Each line contains a key/value pair in the format `{key}={value}` with the key name matching that of a setting found in the `appsettings.{Environment}.json` files.

To specify hierarchical settings, use a double underscore (`__`) to denote hierarchy (avoid using `:`, as [it has issues with platform compatibility](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?tabs=basicconfiguration&view=aspnetcore-3.1#environment-variables-1).

Comments are denoted by a `#` character, and must be at the start of a line or preceded by whitespace.

Array elements should use the element index numbers as part of the value.

### Example

Using the following `appsettings.json` configuration:

```json
{
  "DbDetails": {
    "Host": "localhost",
    "Port": "3306",
    "User": "root",
    "Password": "password"
  },
  "AWS_ACCESS_KEY_ID": "[Your access key]",
  "AWS_SECRET_ACCESS_KEY": "[Your secret key]",
  "AWS_SESSION_TOKEN": null,
  "AWS_DEFAULT_REGION": "us-west-2"
  "Logging":[
        {
            "Name": "ToConsole",
            "Level": "Information"
        }
  ]
}
```

The following `.env` file would set the database user and password, the Logging leven, and the AWS Access Key ID and Secret Access Key:

```conf
DbDetails__User=johndoe
DbDetails__Password=p@$$w0rd
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
setx Logging__0__Level=Warning
```

## Privileged ports on macOS

macOS requires running as `root` to bind to ports < `1024`, so it's best to set something higher in `Properties/launchSettings.json`.
