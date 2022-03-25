# Moq

## Setup Mock to return passed in data

Say we're setting up a mock for a repository method `Create`:

```csharp
public Task PocoObject Create(PocoObject obj);
```

We want to configure the mock to return the passed-in `obj` parameter.

To do so, we explicitly specify the method parameters of the method on the `ReturnsAsync` part of the setup, so that we can refer to those parameters in order to return them:

```csharp
mockRepository
    .Setup(x => x.Create(newObject))
    .ReturnsAsync((PocoObject inputObj, PocoObject outputObj) => inputObj);
```
