# Microsoft Azure cloud services

- [Microsoft Azure cloud services](#microsoft-azure-cloud-services)
  - [Pipelines](#pipelines)
  - [Logs](#logs)
    - [Kusto Query Language (KQL)](#kusto-query-language-kql)
      - [Links](#links)

[Documentation](https://learn.microsoft.com/en-us/azure/?product=popular)

## Pipelines

## Logs

### Kusto Query Language (KQL)

#### Links

[SQL to KQL Cheat Sheet](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/sqlcheatsheet?source=recommendations)

[KQL Quick Reference](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/kql-quick-reference?source=recommendations)

[Syntax Conventions](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/query/syntax-conventions?source=recommendations)

## **Azure SQL**

[documentation](https://learn.microsoft.com/en-us/azure/azure-sql/?view=azuresql)

### Add SQL user to DB

```sql
-- example of creating a readonly user named 'ReadOnlyUser'
CREATE USER [ReadOnlyUser] WITH PASSWORD = 'PASSWORD';
ALTER ROLE [db_datareader] ADD MEMBER [ReadOnlyUser];
```
