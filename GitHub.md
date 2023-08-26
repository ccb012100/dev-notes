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
