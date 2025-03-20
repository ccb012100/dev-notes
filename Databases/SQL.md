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
