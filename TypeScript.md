# TypeScript

## Resolving a Type

Have TS display the properties of the type.

```ts
type Resolve<T> = T extends Function ? T : {[K in keyof T]: T[K]};
```

Also known as `Simplify`, `NOP`, or `NOOP`

_source_: <https://effectivetypescript.com/2022/02/25/gentips-4-display/>

## Testing `protected`/`private` methods

If you have a class `x`, with method `y`, and you can't test it directly via `x.y()` because it's private or protected, use indexing instead, i.e. `x['y']()` or `x.prototype['y']()`
