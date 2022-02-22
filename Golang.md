# Go (Golang)

## [[Windows]]

### Install `tdm-gcc`

[[GCC]] Compiler suite for [[Windows]]

<https://jmeubank.github.io/tdm-gcc/>

If not installed, you'll see the error:

```bash
"gcc": executable file not found in %PATH%
```

## [[Linux]]

### Update Go version

```bash
$ go version

go version go1.8.1 linux/amd64

$ cd /usr/local

$ sudo rm -r /usr/local/go/

$ sudo wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz

... Saving to: ‘go1.11.linux-amd64.tar.gz’

$ sudo tar -C /usr/local -xzf go1.11.linux-amd64.tar.gz

$ go version

go version go1.11 linux/amd64

$ rm go1.11.linux-amd64.tar.gz
```

_source_: <https://golangcode.com/updating-go-on-ubuntu/>
