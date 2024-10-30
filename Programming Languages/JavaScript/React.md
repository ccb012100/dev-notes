# React

<https://react.dev/>

## Components

Basic UI building blocks of React. A reusable function that returns a single JSX element.

## Fragments

React components can only return a single JSX elements, so `<Fragment>` components are used to wrap multiple adjacent
JSX elements without affecting layout or styles.

Using `<> ... </>` instead is idiomatic.

If you need to add a key (for example, when using loops), you must explicitly use `<Fragment>`.

## `StrictMode`

Wrap the root component in `StrictMode` to get extra development-only checks on the entire component tree.

## React Testing Library

<https://testing-library.com/>

### Debugging

<https://testing-library.com/docs/dom-testing-library/api-debugging>

```js
// debug document
screen.debug()
// debug single element
screen.debug(screen.getByText('test'))
// debug multiple elements
screen.debug(screen.getAllByText('multi-test'))

// screen.debug(div) is just a wrapper for console.log(prettyDOM())
console.log(prettyDOM(div));

// log entire document to testing-playground (<https://testing-playground.com/>)
screen.logTestingPlaygroundURL()
// log a single element
screen.logTestingPlaygroundURL(screen.getByText('test'))

// Print out a list of all the implicit ARIA roles within a tree of DOM nodes,
// each role containing a list of all of the nodes which match that role.
// Useful for finding ways to query the DOM under test with getByRole().
logRoles(nav)
```
