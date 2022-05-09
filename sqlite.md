# sqlite

## CLI

<https://www.sqlite.org/cli.html>

Run `sqlite3` to start the sqlite CLI

```sqlite
# open DB file or, if it doesn't exist, create it
.open db1.db

# display results in different formats ("modes")
# where $MODE in
# [ ascii, box, csv, column,
#   html, insert, json, line,
#   list, markdown, quote, table,
#   tabs, tcl
# ]
.mode $MODE

# display as a box, wrap at word boundaries after 30 chars
.mode box --wrap 30 ---word-wrap # or -ww

# display list of tables in DB
.tables

# display schemas for all attached DBs
.schema

# display schema for specific DB
.schema db1.*

# display schema for specific table
.schema tbl1

# pretty-print schema output
.schema --indent

# read SQL queries from a file
#.read myscript.sql

# run SQL query
.select * from tbl1 limit 100;

# include column headers in results
.headers on

# output to file
.output file.csv
 
# dhame output back to console
.output stdout
```
