# Google Chrome

## Keyboard shortcuts

### macOS

Search open tabs

- `Shift-Cmd-A`

Back

- `Cmd-[`

Forward

- `Cmd-]`

## Dev Tools

### Filter Network requests

On the **Network** tab:

In the _Filter_ textbox, use the keywords `domain:` or `url:` to filter on domains or urls, respectively.

#### Filter out matches

Can be done 2 ways:

1. Prepend the keyword with a hyphen (`-`) to filter _out_ (i.e. exclude matches).
2. Check the `Invert` checkbox next to the filter textbox.

#### Examples

- `domain:localhost`
  - Filter on `localhost`
- `url:localhost:44312`
  - Filter on `localhost` port `44312`
- `-domain:localhost`
  - Filter out requests to `localhost`
- `-domain:*.foo.com -domain:*.bar.com`
  - Filter out multiple requests
- `domain:*.foo.com -domain:bar.foo.com`
  - Show all requests to `foo.com` except for those to `bar.foo.com`

Full list at [Filter requests by property](https://developer.chrome.com/docs/devtools/network/reference#filter-by-property).

## Bypass HSTS warning

If you're testing locally, Chrome lets you go to `https://localhost`, but if you're using a redirect in your `hosts` file, even with a signed
certificate, you may get a warning that contains the text _You cannot visit `<URL>` right now because the website uses HSTS_.

To bypass this, type `thisisunsafe⏎` (i.e. `thisisunsafe` followed by `<Return>`/`<Enter>`) while the tab is still in focus and it will bypass the
warning page an load the URL.
