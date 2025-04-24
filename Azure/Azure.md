# Microsoft Azure cloud services

[Documentation](https://learn.microsoft.com/en-us/azure/?product=popular)

## Pipelines

see [Azure Pipelines](</Azure/Azure Pipelines.md>)

## Logs

### Kusto Query Language (KQL)

#### Links

[SQL to KQL Cheat Sheet](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/sqlcheatsheet?source=recommendations)

[KQL Quick Reference](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/kql-quick-reference?source=recommendations)

[Syntax Conventions](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/syntax-conventions?source=recommendations)

### Summarize

```sql
# kql
# Summarize EF Core Warnings
traces
| summarize Count=countif( customDimensions["EventName"] matches regex @"Microsoft\.EntityFrameworkCore\..+Warning" )
    by tostring(customDimensions["EventName"])
| where Count > 0
| sort by Count

# SUMMARIZE DbUpdateConcurrencyExceptions
# WHERE CategoryName is not "Foo.Bar.Baz.Bat" or "Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer"
# BY (FormattedMessage if OriginalFormat is "Error handling message" else OriginalFormat)
exceptions
| summarize Count=countif(
      type == "Microsoft.EntityFrameworkCore.DbUpdateConcurrencyException"
      and customDimensions["CategoryName"] !in("Foo.Bar.Baz.Bat", "Microsoft.AspNetCore.Server.IIS.Core.IISHttpServer")
    ) 
    by iff(
      (customDimensions["OriginalFormat"] == "Error handling message"),
        tostring(customDimensions["FormattedMessage"]),
        tostring(customDimensions["OriginalFormat"])
    )
| where Count > 0
| sort by Count
```

### Regex

#### Escaping

I'm not sure why, but you must use a [verbatim string literal](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/scalar-data-types/string#verbatim-string-literal)
if the regex match contains backslashes (or at least if you want to escape a literal period (`.`) - it might be limited to just that character).

```kql
# to match on "foo.bar.*"

# bad
requests | where customDimensions['Foo'] matches regex 'foo\.bar\..+'

# good
requests | where customDimensions['Foo'] matches regex @'foo\.bar\..+'
```

## **Azure SQL**

[documentation](https://learn.microsoft.com/en-us/azure/azure-sql/?view=azuresql)

### Change SQL User's password

> [!IMPORTANT]
> You must be connected to the `master` database while running the query.

```sql
ALTER LOGIN USERNAME WITH PASSWORD='NEW_PASSWORD' OLD_PASSWORD='OLD_PASSWORD';
```

([source](https://stackoverflow.com/a/40236718/24445522))

### Advanced Application Restart

To perform an _Advanced Application Restart_:

1. Go to the `Web App` instance in the **Azure** portal.
1. Click on `Diagnose and solve problems` in the left-hand navigation panel.
2. In the `Troubleshooting categories > 🔍 Diagnostic Tools` section, click `Advanced Application Restart`
    - Will take you to the paged titled **⚙️ Advanced Application restart**
3. Select the **Server** checkboxes and click `↻ Restart`

## Azure Cosmos DB

<https://learn.microsoft.com/en-us/azure/cosmos-db/>

> [!IMPORTANT] query terminator Cosmos statements do _not_ have a terminator symbol (i.e. `;`). Including one will cause a syntax error

### `OFFSET LIMIT` query

To set a limit, you have to use the format `OFFSET offset_amount LIMIT limit_amount`:

```sql
SELECT *
FROM c
OFFSET 0 LIMIT 10
```

([source](https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/query/offset-limit))

### Find items that are missing a specific field

[`ISNULL(<expr>)`](https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/query/is-null) will only match if the property exists and is set to `null`.

Use [`NOT IsDefined(<expr>)`](https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/query/is-defined), to check if a property exists on a document.

For example, with the items:

```json
[
  {
    "foo": "bar",
  },
  {
    "foo": null,
    "baz": "bat"
  }
]
```

```sql
SELECT * FROM c WHERE ISNULL(c.baz)       -- returns nothing
SELECT * FROM c WHERE NOT DEFINED(c.baz)  -- returns 2nd item
SELECT * FROM c WHERE ISNULL(c.foo)       -- returns 2nd item
```

### `STARTSWITH`

```sql
SELECT * FROM c WHERE STARTSWITH(c.foo, "bar")        -- case sensitive
SELECT * FROM c WHERE STARTSWITH(c.foo, "bar", false) -- case sensitive
SELECT * FROM c WHERE STARTSWITH(c.foo, "bar", true)  -- case-insensitive
```

([source](https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/query/startswith))

## Application Insights

### Adaptive Sampling

`ExcludedTypes` takes precedence over `IncludedTypes`; it's best to only use one or the other.

### Check Sampling level

Run the query:

```sql
union requests,dependencies,pageViews,browserTimings,exceptions,traces,customEvents
| where timestamp > ago(1d)
| summarize RetainedPercentage = 100/avg(itemCount) by bin(timestamp, 24h), itemType
```

Any type where `RetainedPercentage` is less than `100` is being sampled.

([source](https://learn.microsoft.com/en-us/azure/azure-monitor/app/sampling-classic-api#knowing-whether-sampling-is-in-operation))

### Configuring the **Application Insights SDK** in .NET Core

#### .NET API

```cs
public void ConfigureServices(IServiceCollection services)
{
    services.Configure<Microsoft.ApplicationInsights.Extensibility.TelemetryConfiguration>(
        telemetryConfiguration => telemetryConfiguration.DefaultTelemetrySink
            .TelemetryProcessorChainBuilder
            .UseAdaptiveSampling(
                settings: new SamplingPercentageEstimatorSettings
                {
                    MinSamplingPercentage = 0.01,
                    MaxSamplingPercentage = 100,
                    MaxTelemetryItemsPerSecond = 5
                },
                callback: null,
                excludedTypes: "Exception;Event" // exclude Exceptions and Events from adaptive sampling
            )
            .Build()
        )
        // IMPORTANT: 'EnableAdaptiveSampling' MUST be set to 'false' when using 'UseAdaptiveSampling'.
        .AddApplicationInsightsTelemetry(options => options.EnableAdaptiveSampling = false);
}
```

([source](https://learn.microsoft.com/en-us/azure/azure-monitor/app/sampling-classic-api#configure-sampling-settings))

### Azure Functions

([source](https://learn.microsoft.com/en-us/azure/azure-functions/configure-monitoring?tabs=v2#configure-sampling))

#### Core Tools

##### inproc8 model host fails to start on macOS

If in-process model fails to start because of permissions, running `sudo chmod +x` on the executable will fix it.

```zsh
$ func start
Failed to start the inproc8 model host. An error occurred trying to start process '/opt/homebrew/Cellar/azure-functions-core-tools@4/4.0.7030/in-proc8/func' with working directory '/Users/ccb012100/work/dpc/CCT-consent-service/src/Cct.Consent.Service.Functions.Shared/bin/output'. Permission denied
$ sudo chmod +x /opt/homebrew/Cellar/azure-functions-core-tools@4/4.0.7030/in-proc8/func
```

([source](https://github.com/Azure/azure-functions-core-tools/issues/3766))
