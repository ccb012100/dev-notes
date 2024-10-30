# chezmoi

dotfiles manager

## directory

`~/.local/share/chezmoi`

### navigate to `chezmoi` directory

```bash
chezmoi cd
```

## Dry run

- `--dry-run` or `-n`

## Templates

Templates use Go's [`text/template`](https://pkg.go.dev/text/template#section-documentation) library.

- Additional `Sprig` library [functions](https://masterminds.github.io/sprig/)
- Additional `chezmoi` [Functions](https://www.chezmoi.io/reference/templates/functions/)

### `contains` function

To test if one string contains another, use the [`contains`](https://masterminds.github.io/sprig/strings.html) function.

> [!WARNING]
>
> The function is in the form `contains substring string`.
>
> For example, to test if the `.chezmoi.kernel.osrelease` variable contains the string `microsoft-standard-WSL2`:
>
> ```go
> contains "microsoft-standard-WSL2" .chezmoi.kernel.osrelease
> ```

### Detect Windows Subsystem for Linux (WSL2)

```go-template
{{- if eq .chezmoi.os "linux" }}
  {{- if (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
  # WSL-specific code
  {{- end }}
{{- end }}

{{/* single check */ -}}
{{- if (and (eq .chezmoi.os "linux") (.chezmoi.kernel.osrelease | lower | contains "microsoft"))}}
  # WSL-specific code
{{- end }}
```
