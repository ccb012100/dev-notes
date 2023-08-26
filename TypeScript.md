# TypeScript

## Resolving a Type

Have TS display the properties of the type.

```ts
type Resolve<T> = T extends Function ? T : {[K in keyof T]: T[K]};
```

Also known as `Simplify`, `NOP`, or `NOOP`

_source_: <https://effectivetypescript.com/2022/02/25/gentips-4-display/>
