# dotnet

- [dotnet](#dotnet)
  - [App secrets](#app-secrets)
    - [Directory location](#directory-location)
    - [Add secrets to project](#add-secrets-to-project)
      - [Option 1: Load from a JSON file](#option-1-load-from-a-json-file)
      - [Option 2: Using Secret Manager tool](#option-2-using-secret-manager-tool)
        - [Set secret](#set-secret)
          - [Nested properties](#nested-properties)
        - [Remove secret](#remove-secret)
        - [List secrets](#list-secrets)
        - [Clear all secrets](#clear-all-secrets)
      - [Option 3: Editing secrets file directly](#option-3-editing-secrets-file-directly)
  - [\[\[NuGet\]\] packages](#nuget-packages)
  - [dotnet-outdated-tool](#dotnet-outdated-tool)
  - [System.Text.Json](#systemtextjson)
    - [Pretty-print an object](#pretty-print-an-object)
  - [XUnit](#xunit)
    - [Print a message to the test output window](#print-a-message-to-the-test-output-window)
  - [Test Shims](#test-shims)
    - [Pose package](#pose-package)
      - [Usage](#usage)
  - [Testing](#testing)
    - [`HttpContext` in a `Controller`](#httpcontext-in-a-controller)
  - [Log HTTP requests and responses](#log-http-requests-and-responses)

## App secrets

[Safe storage of app secrets in development in ASP.NET Core](https://docs.microsoft.com/en-us/aspnet/core/security/app-secrets?view=aspnetcore-5.0&tabs=windows)

### Directory location

[[macOS]]

`${HOME}\.microsoft\usersecrets\`

[[Windows]]

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

## [[NuGet]] packages

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

# clear local [[NuGet]] cache
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
