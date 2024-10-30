# Mermaid

JavaScript tool for creating diagramming/charting in Markdown documents.

[Documentation](https://mermaid.js.org/intro/)

## Empty nodes

Use a space character as the label to make the node empty.

## GitHub

Supported in GitHub documents.

### Caveats

- Markdown strings are not supported and will just be treated as string literals
- HTML escape codes (e.g. `&nbsp;`) are not supported and will just be treated as string literals
- Multiline node labels _must_ be wrapped in double quotes (`"`):

    ```plaintext
    x(this is
    invalid)

    x("this is
    valid")
    ```

- A closing bracket must be on the same line as the end of the node label:

    ```plaintext
    x("valid")

    x("invalid"
    )
    ```
