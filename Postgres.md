# PostgreSQL

## psql

PostgreSQL CLI tool

<https://www.postgresql.org/docs/current/app-psql.html>

### open `psql` with connect to database

```bash
psql -d DATABASE_NAME
```

### `psql` commands

#### connect to database

```bash
\c DATABASE_NAME
```

#### list databases

```bash
\l
```

#### list tables

```bash
# list tables in public schema
\dt

# list tables in specific schema
\dt SCHEMA_NAME.*

# list tables in all schemas
\dt *.*

# list tables in all schemas using SQL
SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND schemaname != 'information_schema';
```

#### view table schema

```bash
\d TABLE_NAME

# view additional info
\d+ TABLE_NAME
```

#### output to file

```bash
# start writing to FILE_NAME
\o FILE_NAME

# run SQL commands
...

# stop writing to file
\o

```

#### change table format

```bash
# Possible values: psql, plain, simple, grid, fancy_grid, pipe,
# ascii, double, github, orgtbl, rst, mediawiki, html, latex,
# latex_booktabs, textile, moinmoin, jira, vertical, tsv, csv
#
# Recommended: psql, fancy_grid and grid.

\T TABLE_FORMAT
```
