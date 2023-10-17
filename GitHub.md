# GitHub

## see a user's public keys

`https://github.com/<username>.keys`

### public GPG keys

`https://github.com/<username>.gpg`

## Pull Requests

### mark all files viewed

Create a bookmarklet:

```js
javascript:document.getElementsByName("viewed").forEach(ch => {
    if(!ch.checked) {
        ch.click();
    }
})
```

*source:* [stackoverflow.com](https://stackoverflow.com/questions/69945775/how-to-unview-toggle-all-the-viewed-files-on-github-pull-request#comment126429925_69945864)

### add GitHub to `known_hosts`

```bash
ssh-keyscan github.com >> ~/.ssh/known_hosts
```

## Search

[Syntax documentation](https://docs.github.com/en/search-github/github-code-search/understanding-github-code-search-syntax)

### search for file by filename

to find a file named `wezterm.lua`:

`path:wezterm.lua`

to find a file named `wezterm.lua` located in a repository at `/config/wezterm`:

`path:config/wezterm/wezterm.lua`

to find files of type `.lua`:

`path:*.lua`
