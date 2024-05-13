# dotnet

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

## NuGet packages

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

## dotnet-outdated-tool

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

## Trust dev HTTPS Certificates in Docker containers running in WSL with Docker Compose

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
