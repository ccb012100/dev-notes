# cURL

- [cURL](#curl)
  - [Configuration file](#configuration-file)
  - [Allow insecure connections](#allow-insecure-connections)
  - [Show HTTP response headers](#show-http-response-headers)
  - [Show HTTP request headers](#show-http-request-headers)
  - [Show specific response data](#show-specific-response-data)
  - [Follow redirects](#follow-redirects)
  - [Only output errors](#only-output-errors)
  - [URL globbing](#url-globbing)
    - [Disable globbing](#disable-globbing)
  - [Save to file](#save-to-file)
  - [Retries](#retries)
  - [POST](#post)
    - [JSON](#json)
  - [URL-encode data](#url-encode-data)
  - [download a file](#download-a-file)
    - [flags](#flags)

["Client for URL"](https://curl.se/)

[Everything curl](https://everything.curl.dev/) book

## Configuration file

Defaults to `$HOME/.curlrc`

## Allow insecure connections

`-k`, `--insecure`

> (SSL) This option explicitly allows curl to perform "insecure" SSL connections and transfers. All SSL connections are
> attempted to be made secure by using the CA certificate bundle installed by default. This makes all connections
> considered "insecure" fail unless -k, --insecure is used.

## Show HTTP response headers

`-i`, `--include`

> Include the HTTP response headers in the output. The HTTP response headers can include things like server name,
> cookies, date of the document, HTTP version and more...
>
> To view the request headers, consider the `-v`, `--verbose` option.

## Show HTTP request headers

> To view the request headers, consider the `-v`, `--verbose` option.

## Show specific response data

`--write-out`, `-w`

## Follow redirects

`-L`, `--follow`

Add `--max-dirs NUM` to prevent an infinite redirect loop

## Only output errors

`-sS`, `--silent --show-error`

## URL globbing

Example:

`curl https://example.com/foo/{x,y}?bar=[1-3]`

Will call:

```txt
example.com/foo/x/bar=1
example.com/foo/x/bar=2
example.com/foo/x/bar=3

example.com/foo/y/bar=1
example.com/foo/y/bar=2
example.com/foo/y/bar=3
```

### Disable globbing

You can disable with `--glob-off` if the URL contains glob characters.

## Save to file

```bash
curl --output-dir DIR -O URL

# create output dir if it doesn't exist
curl --output-dir DIR --create-dirs -O URL
```

## Retries

```bash
curl --retry NUM URL

# add delay (in seconds) between retries
curl --retry NUM URL --retry-delay NUM
```

## POST

### JSON

`curl --json JSON URL`

example

```bash
curl --json '{"name": "alice"}' http://www.example.com
```

## URL-encode data

`--data-urlencode`

## download a file

Basic syntax

```bash
curl URL --output FILE # or -o
```

### flags

- `--output-dir DIR` - directory to create the file specified by `-o`/`--output`
- `--create-dirs` - create directories specified by `--output`/`--output-dir` if they don't exist
