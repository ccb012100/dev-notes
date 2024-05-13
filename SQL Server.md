# Microsoft SQL Server

_Note:_ Unless specified, notes apply to both **Azure DB** and **SQL Server 2016** (`13.x`) and later.

<https://learn.microsoft.com/en-us/sql/sql-server/?view=sql-server-ver16>

## View a table's properties

```sql
EXEC sys.sp_help 'dbo.TABLE_NAME'
```

## View a table's schema

```sql
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = N'TABLE_NAME';
```

## List DB users

```sql
SELECT * FROM sysusers
```

## List server logins

```sql
SELECT * FROM master.sys.server_principals
```

## SQL users

### Add a user to a database

```sql
CREATE USER [<username>] WITH PASSWORD = '<password>'
ALTER ROLE [db_datareader] ADD MEMBER [<username>]
```

### Drop a user from a database

```sql
DROP USER IF EXISTS <username>;
```
