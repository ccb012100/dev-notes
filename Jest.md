# Jest JavaScript testing framework

[Documentation](https://jestjs.io/docs/getting-started)

## Running tests from the CLI

```bash
# run tests in FILE
npx jest --coverage --coverageReporters cobertura --runTestsByPath FILE

# run tests in FILE and watch for file changes and rerun tests on change
npx jest --coverage --coverageReporters cobertura --watch FILE

# only run test to related to changed files (must be in a Git project)
npx jest --coverage --coverageReporters cobertura --watch --only-changed # or -o
```

## `getBy*` vs. `queryBy*`

`getBy*` methods throw if they can't find a match. The `queryBy*` or `queryAllBy*` (which return an array of matches)
methods will not throw.

## `toBeInTheDocument`

When testing `not.toBeInTheDocument`, use `screen.queryBy*()`.

_source_: <https://stackoverflow.com/a/52783201>

## Mocks

```js
// foo is a function imported from ./foo-bar module
import foo from './foo-bar';

// variables must be named mock* to be used within jest.mock()
const mockParamVal = 'baz';
let mockRetVal = 'quux';

// mock only `foo` function from ./foo-bar module
jest.mock('./foo-bar', () => ({
    foo: jest.fn((val) => {
        if (val === mockParamVal) {
            return mockRetVal
        }

        throw Error('Invalid call to mock foo')
    }),
}));
```
