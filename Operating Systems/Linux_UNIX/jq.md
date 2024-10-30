# `jq`

Command-line JSON processor

<https://stedolan.github.io/jq/tutorial/>

```JSON
[
    {
        "foo" : { "bar": 42, "baz": true },
        "quux" : "abc"
    },
    {
        "foo" : { "bar" : 100, "baz": false },
        "quux" : "xyz"
    }
]
```

```bash
# pretty-print JSON
JSON | jq '.'

# print first entry in array
jq '.[0]'

# map each array element onto a new array of { bar: number, quux: string }
jq '.[] | { bar: .foo.bar, quux: .quux }
```
