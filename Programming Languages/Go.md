# Go (Golang)

## Modules

### Create module

`go mod init`

```go
// example
go mod init github.com/ccb012100/hello-world
```

### Add module as dependency

`go get`

```go
// example
go get github.com/spf13/cobra
```

### Add missing and remove unused modules

`go mod tidy`

## Windows

### Install `tdm-gcc`

GCC Compiler suite for Windows

<https://jmeubank.github.io/tdm-gcc/>

If not installed, you'll see the error:

```bash
"gcc": executable file not found in %PATH%
```

## Linux

### Update Go version

(It's better to use homebrew)

```bash
$ go version

go version go1.x linux/amd64

$ cd /usr/local

$ sudo rm -r /usr/local/go/

$ sudo wget https://dl.google.com/go/go1.y.linux-amd64.tar.gz

Saving to: ‘go1.y.linux-amd64.tar.gz’

$ sudo tar -C /usr/local -xzf go1.y.linux-amd64.tar.gz

$ go version

go version go1.y linux/amd64

$ rm go1.y.linux-amd64.tar.gz
```

([source](https://golangcode.com/updating-go-on-ubuntu/))

### Install `gcc`

This applies when Go has been installed via [homebrew]

### Error

```bash
exec: "gcc-5": executable file not found in $PATH
```

### Fix

```bash
brew install gcc@5
```
