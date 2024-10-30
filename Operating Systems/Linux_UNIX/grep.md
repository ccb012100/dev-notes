# grep

_NOTE_: see ripgrep for more syntax

## search a directory recursively

```bash
grep -nr '{search-term}' directory-name
```

- `-n`
  - Show relative line number in the file
- `-r`
  - Recursively search subdirectories listed
- `search-term`
  - String for search
- `directory-name`
  - Directory for search
