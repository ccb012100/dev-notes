# Moq

## Setup Mock to return passed in data

Say we're setting up a mock for a repository method `Create`:

```csharp
public Task PocoObject Create(PocoObject obj);
```

We want to configure the mock to return the passed-in `obj` parameter.

To do so, we explicitly specify the method parameters of the method on the `ReturnsAsync` part of the setup, so that we
can refer to those parameters in order to return them:

```csharp
mockRepository
    .Setup(x => x.Create(newObject))
    .ReturnsAsync((PocoObject obj) => obj);
```

## Mocking `ILogger`

`ILogger`'s methods `LogDebug`, `LogError`, _etc._ are actually just extension methods, and so have to be mocked on the
the underlying method, which is a bit fiddly:

```csharp
_logger.Setup(x =>
    x.Log(
        LogLevel.Error,
        It.IsAny<EventId>(),
        It.Is<It.IsAnyType>((v, t) => v.ToString() == expectedErrorMessage),
        It.IsAny<Exception>(),
        It.Is<Func<It.IsAnyType, Exception?, string>>((v, t) => true)));
```

_source_: <https://carlpaton.github.io/2021/02/mocking-ilogger/>
