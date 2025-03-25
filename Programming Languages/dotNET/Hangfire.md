# Hangfire background job library

- <https://www.hangfire.io/>
- <https://github.com/HangfireIO/Hangfire>

## Dependency Injection

This is not documented in the Hangfire DI/IoC Container/ documentation.

To use the built-in .NET DI, you need to pass in an instance of `AspNetCoreJobActivator` to `UseActivator()` inside the call to `.AddHangfire()`:

```c#
public void ConfigureServices(IServiceCollection services){
  // -snip-
  // Add Hangfire services
  services.AddHangfire((provider, hangfireConfig) =>
    hangfireConfig
      .SetDataCompatibilityLevel(CompatibilityLevel.Version_180)
      .UseSimpleAssemblyNameTypeSerializer()
      .UseRecommendedSerializerSettings()
      .UseSqlServerStorage(configuration.GetConnectionString("CONNECTION_STRING"))
      .UseActivator( // enable built-in .NET DI
        new AspNetCoreJobActivator(
          provider.GetRequiredService<IServiceScopeFactory>())
      )
  )
  // -snip-
}
```

([source](https://stackoverflow.com/a/79308409))
