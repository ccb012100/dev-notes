# awk

```bash
# print lines matching $PATTERN
awk '/$PATTERN/ {print}' $file

# print fields $1 and $2
# parameters separated by a comma are printed with the value of OFS (defaults
# to a single blank space) between them
awk '{ print $1,$2 }'

# print contents of $file in .csv format
awk '{ print $1 "," $2 }' $file

# print as .csv format with header row
awk 'BEGIN { print "column one title" "," "column two title" } { print $1 "," $2 }' $file

# print file with numbered lines
# $0 = whole line
# NR = current number of records
awk '{ print NR,$0 }' $file

# print last field
awk '{ print $NF }' $file

# specify colon as file separator (FS)
awk -F ":" '{ print $NR }' $file

awk 'BEGIN { FS=":" } {print $NR}'
```
