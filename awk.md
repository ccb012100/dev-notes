# awk

- [HANDY ONE-LINE SCRIPTS FOR AWK](https://www.pement.org/awk/awk1line.txt)
- [Chart of similar operations with sed and awk](https://www.pement.org/awk/awk_sed.txt)
- [Source of some of the below commands](https://wizardzines.com/comics/awk/)

## Basic program structure

```awk
BEGIN { ... }
condition { action }
condition { action }
END { ... }
```

## Examples

```bash
# print lines matching $PATTERN
awk '/$PATTERN/ {print}' FILE

# print fields $1 and $2
# parameters separated by a comma are printed with the value of OFS (defaults
# to a single blank space) between them
awk '{ print $1,$2 }'

# print contents of FILE in .csv format
awk '{ print $1 "," $2 }' FILE

# print as .csv format with header row
awk 'BEGIN { print "column one title" "," "column two title" } { print $1 "," $2 }' FILE

# print file with numbered lines
# $0 = whole line
# NR = current number of records
awk '{ print NR,$0 }' FILE

# print last field
awk '{ print $NF }' FILE

# specify colon as file separator (FS)
awk -F ":" '{ print NR }' FILE
# :: alternate way
awk 'BEGIN { FS=":" } {print $NR}'

# print number of lines
awk '{ print } END{ print NR }'

# sort file, leaving header at top
awk 'NR <2 { print; next } { print | "sort }' FILE

# sum the number in the 3rd column
awk '{s += $3} END {print s}'

# print ever line over 80 chars (the {print} action is implicit)
awk 'length($0) > 80'
```
