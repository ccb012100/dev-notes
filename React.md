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
