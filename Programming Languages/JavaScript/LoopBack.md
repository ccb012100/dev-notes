# LoopBack

Nodejs REST API framework

<https://loopback.io/doc/en/lb4>

## Databases

### Where filter

#### `inq`

Check if value of property is contained in an array.

```js
{where: { property: { inq: [val1, val2, ...]}}}
```

<https://loopback.io/doc/en/lb4/Where-filter.html>

#### `ilike`/`nlike`

Match on case-insensitive regexes.

Supported by the Postgres connectors.

##### Postgres connector syntax

```js
await userRepository.find({where: {name: {ilike: 'john%'}}});
```

#### `contains`

Postgres-specific operator

Query Postgres array for existence of specific value(s)

ex.

```typescript
// 'categories' is a postgres string[]

const posts = await postRepository.find({
  where: {
    {
      categories: {'contains': ['AA']},
    }
  }
});
```
