# Microsoft SQL Server and Transact-SQL (T-SQL)

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

([source](https://learn.microsoft.com/en-us/sql/relational-databases/tables/view-foreign-key-properties?view=sql-server-ver16))

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
CREATE USER [USERNAME] WITH PASSWORD = 'PASSWORD'
ALTER ROLE [db_datareader] ADD MEMBER [username]
```

### Drop a user from a database

```sql
DROP USER IF EXISTS USERNAME;
```

## Check current index fragmentation levels

```sql
-- Run against your database to check the current index fragmentation levels
SELECT
 idxs.[object_id]
 ,ObjectSchema = OBJECT_SCHEMA_NAME(idxs.object_id)
 ,ObjectName = OBJECT_NAME(idxs.object_id)
 ,IndexName = idxs.name
 ,idxs.type
 ,idxs.type_desc
 ,i.avg_fragmentation_in_percent
 ,i.page_count
 ,i.index_id
 ,i.partition_number
 ,i.avg_page_space_used_in_percent
 ,i.record_count
 ,i.ghost_record_count
 ,i.forwarded_record_count

FROM sys.indexes idxs
INNER JOIN sys.dm_db_index_physical_stats(DB_ID(),NULL, NULL, NULL, 'SAMPLED') i  ON i.object_id = idxs.object_id AND i.index_id = idxs.index_id

WHERE idxs.type IN (0 /*HEAP*/, 1/*CLUSTERED*/, 2/*NONCLUSTERED*/, 5/*CLUSTERED COLUMNSTORE*/, 6/*NONCLUSTERED COLUMNSTORE*/)
AND (alloc_unit_type_desc = 'IN_ROW_DATA' /*avoid LOB_DATA or ROW_OVERFLOW_DATA*/ OR alloc_unit_type_desc IS NULL /*for ColumnStore indexes*/)
AND OBJECT_SCHEMA_NAME(idxs.object_id) != 'sys'
AND idxs.is_disabled = 0

ORDER BY i.avg_fragmentation_in_percent DESC, i.page_count DESC
```

## `WITH VALUES`

When you add a new nullable column with a default value to a table, existing records will have the column set to `NULL`.

To instead fill them with the default value, use `WITH VALUES`.

```sql
ALTER TABLE Foo
ADD Bar int DEFAULT(0) WITH VALUES; -- sets existing to NULL

ALTER TABLE Foo
ADD Bar int DEFAULT(0) WITH VALUES; -- sets existing to 0
```
