# .env

[[.NET]] environments file

([source](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration))

## `dotnet-env` NuGet package

Use with [dotnet-env](https://github.com/tonerdo/dotnet-env) to override values in the `appsettings.{Environment}.json` files through use of a `.env` file.

`.env` takes precedence over the app settings files, and by adding `.env` in `.gitignore`, you can use `.env` to modify settings locally without running the risk of accidentally committing the changes.

## File Format

The file should be named `.env` and placed in the project folder for the project that is being run.

Each line contains a key/value pair in the format `{key}={value}` with the key name matching that of a setting found in the `appsettings.{Environment}.json` files.

To specify hierarchical settings, use a double underscore (`__`) to denote hierarchy (avoid using `:`, as [it has issues with platform compatibility](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?tabs=basicconfiguration&view=aspnetcore-3.1#environment-variables-1).

Comments are denoted by a `#` character, and must be at the start of a line or preceded by whitespace.

Array elements should use the element index numbers as part of the value.

## Example

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
