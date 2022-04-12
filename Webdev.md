# Webdev

Miscellanious web development notes

## Developer Tools

### Log a variable name's along with the value

Wrap the variable in brackets `{ }`

#### Example

```js
console.log({ x });
```

### Console

#### Printing methods

- `console.log` - Prints the text to the console as a log message.
- `console.info` - Prints the text to the console as an informational message.
- `console.error` - Prints the text to the console as an error message.
- `console.warn` - Prints the text to the console as a warning.

#### Formatting

- `%s` logs as Strings.
- `%i` or `%d` logs as Integers.
- `%f` logs as a floating-point value.
- `%o` logs as an expandable DOM element.
- `%O` logs as an expandable JavaScript object.
- `%c` allows you to style you message with CSS.

#### Tracing

`console.trace` outputs a stack trace to the console.

You can also provide data.

##### Syntax

```js
console.trace([...any, ...data]);
```

#### Group messages

`console.group` creates a new inline group in the Web console log.

Subsequent messages are indented by an additional level until `console.groupEnd()` is called.

##### Example

```js
console.log('This is the outer level');
console.group();
console.log('Level 2');
console.groupEnd();
console.log('Back to the outer level');
```

#### Count

`console.count` logs the number of times that `count` has has been called with that particular label.

##### Syntax

```js
console.count(label);
```

`label` is optional, and 'default' is used as the label if no value is specified

#### Table

`console.table` displays tabular data as a table.

By default, `console.table` lists all elements in each row. You can use the optional `columns` parameter to select a subset of columns to display.

The `data` parameter must be an array or an object. Each element in the array (or enumerable property if `data` is an object) will be a row in the table.

The first column in the table will be labeled `(index)`. If `data` is an array, then its values will be the array indices. If `data` is an object, then its values will be the property names.

##### Syntax

```js
console.table(data);
console.table(data, columns);
```

#### Snippets

<https://docs.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/javascript/snippets>

JS snippets for running against any webpage
