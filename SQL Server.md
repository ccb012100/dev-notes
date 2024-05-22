# Microsoft SQL Server

_Note:_ Unless specified, notes apply to both **Azure DB** and **SQL Server 2016** (`13.x`) and later.

<https://learn.microsoft.com/en-us/sql/sql-server/?view=sql-server-ver16>

## Schema information

### View a table's properties

```sql
EXEC sys.sp_help 'dbo.TABLE_NAME'
```

### List schemas

```sql
select s.name as schema_name,
    s.schema_id,
    u.name as schema_owner
from sys.schemas s
    inner join sys.sysusers u
        on u.uid = s.principal_id
order by s.name;
```

### View schema all tables in a databas

```sql
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS;

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'SCHEMA_NAME';
```

### View a table's schema

```sql
-- method 1
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_name = N'TABLE_NAME';

-- method 2
sp_help 'TABLE_NAME'
```

### View foreign keys

```sql
USE DATABASE_NAME;
GO

SELECT f.name AS foreign_key_name,
    OBJECT_NAME(f.parent_object_id) AS table_name,
    COL_NAME(fc.parent_object_id, fc.parent_column_id) AS constraint_column_name,
    OBJECT_NAME(f.referenced_object_id) AS referenced_object,
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS referenced_column_name,
    f.is_disabled,
    f.is_not_trusted,
    f.delete_referential_action_desc,
    f.update_referential_action_desc
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc
    ON f.object_id = fc.constraint_object_id;
```

_source_: <https://learn.microsoft.com/en-us/sql/relational-databases/tables/view-foreign-key-properties?view=sql-server-ver16>

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
