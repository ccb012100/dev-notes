# NSubstitute

.NET Mocking library.

- [GitHub](https://github.com/nsubstitute/NSubstitute)

## Mocking `ILogger<T>`

```c#
var logger = logger = Substitute.For<ILogger<T>>();
logger.IsEnabled(Arg.Any<LogLevel>()).Returns(true)

logger.Received(1).Log(
    Arg.Is(LogLevel.Error),
    Arg.Any<EventId>(),
    Arg.Is<object>(o => o.ToString().Contains("exception message")),
    Arg.Any<Exception>(),
    Arg.Any<Func<object, Exception, string>>()
);
```

([source](https://stackoverflow.com/a/79155793))
