# Mermaid

[[JavaScript]] tool for creating diagramming/charting in [[Markdown]] documents.

[Documentation](https://mermaid.js.org/intro/)

## GitHub

Supported in [[GitHub]] documents.

### Caveats

Multiline node labels _must_ be wrapped in double quotes (`"`).

```mermaid
---
title: Example
---
%%{init: {"flowchart": {"htmlLabels": false}} }%%
graph TD
    subgraph VALID
        v1 --> v2("one
        two
        three")
    end

    subgraph INVALID
        i1 --> i2(one
        two
        three)
    end

```
