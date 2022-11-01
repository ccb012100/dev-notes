# PostgreSQL

## psql

<https://www.postgresql.org/docs/current/app-psql.html>

postgres CLI tool

- connect to database

```bash
psql -d DATABASE_NAME
```

- view table schema

```bash
\d TABLE_NAME

# view additional info
\d+ TABLE_NAME
```

- output to file

```bash
# start writing to FILE_NAME
\o FILE_NAME

# run SQL commands
...

# stop writing to file
\o

```
