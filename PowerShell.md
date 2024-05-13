# PowerShell

## Get the version of the running instance

```pwsh
Get-Host | Select-Object Version
```

## Profile

### Get Name/Location of Profile

```pwsh
$PROFILE
```

### Reload Profile

Same as Bash

```pwsh
. $PROFILE
```

## Operators

### Call Operator (`&`)

[Docs](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.3)

a.k.a. _Invocation Operator_

Run a command, script or script block

### Grouping Operator (`( )`)

Serves to override operator precedence in expressions

### Subexpression operator `$( )`

Returns the result of one or more statements. Use to use an expression within another expression

### Array subexpression operator `@( )`

Returns the result of one or more statements as an array. The result is always an array of 0 or more objects.

## Set Environment variable for command

Equivalent to `FOO=bar COMMAND` in Bash

```pwsh
# set and then remove 
env:FOO='bar'; COMMAND; Remove-Item Env:\FOO

# run in separate process
pwsh -Command { $env:FOO="bar"; COMMAND }
```

## Help

`Get-Help <Command>` or `Help <Command>`

```pwsh
Get-Help -Name COMMAND -Full
Get-Help -Name COMMAND -Detailed
Get-Help -Name COMMAND -Examples
Get-Help -Name COMMAND -Online
Get-Help -Name COMMAND -Parameter <Noun>
Get-Help -Name COMMAND -ShowWindow

# update local copy of help topics
Update-Help
```

## Sign scripts

Follow the
[documentation](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_signing?view=powershell-7.3)
for creating a self-signed certificate.

## View the properties of an object

Pipe the object to `Format-List`

## View the properties and methods of an object's class/type

Pipe the object to `Get-Member`

## Write to Console

`Write-Host`
