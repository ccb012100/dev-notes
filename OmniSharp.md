# OmniSharp

## [[C#]] [[Intellisense]] not working

If OmniSharp is not working correctly, for example:

- Intellisense broken
- Not showing Errors
- Tests won't run:

```text
Failed to run test because "System.ArgumentNullException: Value cannot be null.\r\nParameter name: workingDirectory\r\n   at OmniSharp.DotNetTest.TestManager..ctor
```

If you're working with a [[.NET]] Solution, OmniSharp may be pointing to the wrong project. In [[VS Code]], open the _Command Pallete_, select the command `OmniSharp: Select Project`, and select the `.sln` option.
