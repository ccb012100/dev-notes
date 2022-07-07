# LoopBack

[[Nodejs]] REST API framework

<https://loopback.io/doc/en/lb4>

## Databases

### Where filter

<https://loopback.io/doc/en/lb4/Where-filter.html>

### `ilike`/`nlike`

Match on case-insensitive [[regex]]es.

Supported by the [[Postgres]] connectors.

#### [[Postgres]] connector syntax

```js
await userRepository.find({where: {name: {ilike: 'john%'}}});
```

#### `inq`

Check if value of property is contained in an array.

```js
{where: { property: { inq: [val1, val2, ...]}}}
```
