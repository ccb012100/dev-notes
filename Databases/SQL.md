# SQL

Notes that apply to Structured Query Language in general

## `IS DISTINCT FROM`

When comparing values on a nullable column, `<>` or `!=` will exclude `NULL`s.

To include `NULL` entries, use `IS DISTINCT FROM`.

```sql
CREATE TABLE Foo (
    Bar bit
);

SELECT Bar
FROM Foo
WHERE Bar <> 1; -- only returns 0

SELECT Bar
FROM Foo
WHERE Bar IS DISTINCT FROM 1; -- returns 0 and NULL
```

## Enum foreign key table

To enforce a range of values in a text column, you can create an "enum table" and use it as a foreign key.

```sql
-- in T-SQL:
CREATE TABLE Kind(
    Value nvarchar(50) NOT NULL PRIMARY KEY,
    Description nvarchar(MAX) NOT NULL DEFAULT ''
);

INSERT INTO Kind(Value, Description)
VALUES
    ('foo', 'Lorem ipsum dolor sit amet'),
    ('bar', 'consectetur adipiscing elit'),
    ('baz', 'sed do eiusmod tempor');

CREATE TABLE Enum(
    Id uniqueidentifier PRIMARY KEY,
    Created_at datetime2 NOT NULL DEFAULT SYSUTCDATETIME(),
    Kind nvarchar(50) FOREIGN KEY REFERENCES Kind(Value) -- enforces that it matches an entry in the enum table
);
```
