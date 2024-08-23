# Microsoft Azure cloud services

[Documentation](https://learn.microsoft.com/en-us/azure/?product=popular)

## Pipelines

see [[Azure Pipelines]]

## Logs

### Kusto Query Language (KQL)

#### Links

[SQL to KQL Cheat Sheet](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/sqlcheatsheet?source=recommendations)

[KQL Quick Reference](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/kql-quick-reference?source=recommendations)

[Syntax Conventions](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/syntax-conventions?source=recommendations)

### Summarize

```kql
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

### Add SQL user to DB

```sql
-- example of creating a readonly user named 'ReadOnlyUser'
CREATE USER [ReadOnlyUser] WITH PASSWORD = 'PASSWORD';
ALTER ROLE [db_datareader] ADD MEMBER [ReadOnlyUser];
```

### Advanced Application Restart

To perform an _Advanced Application Restart_:

1. Go to the `Web App` instance in the **Azure** portal.
1. Click on `Diagnose and solve problems` in the left-hand navigation panel.
2. In the `Troubleshooting categories > 🔍 Diagnostic Tools` section, click `Advanced Application Restart`
    - Will take you to the paged titled **⚙️ Advanced Application restart**
3. Select the **Server** checkboxes and click `↻ Restart`

## Azure Cosmos DB

<https://learn.microsoft.com/en-us/azure/cosmos-db/>

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
select * from c ISNULL(c.baz) -- returns nothing
select * from c NOT DEFINED(c.baz) -- returns 2nd item
select * from c ISNULL(c.foo) -- returns 2nd item
```
