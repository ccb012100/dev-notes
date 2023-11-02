# GitHub

- [GitHub](#github)
  - [see a user's public keys](#see-a-users-public-keys)
    - [public GPG keys](#public-gpg-keys)
  - [Pull Requests](#pull-requests)
    - [mark all files viewed](#mark-all-files-viewed)
    - [add GitHub to `known_hosts`](#add-github-to-known_hosts)
  - [Search](#search)
    - [search for file by filename](#search-for-file-by-filename)
  - [Github Codespaces](#github-codespaces)
    - [dotfiles](#dotfiles)
      - [Dotfiles location](#dotfiles-location)
      - [`install.sh`](#installsh)
  - [GitHub Actions](#github-actions)
    - [Key Concepts](#key-concepts)
    - [Actions](#actions)
    - [Workflows](#workflows)
    - [Jobs](#jobs)
    - [Steps](#steps)

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

## Github Codespaces

<https://docs.github.com/en/codespaces>

### dotfiles

You can specify a dotfiles repository <https://github.com/settings/codespaces> to load when a new Codespace is created.

#### Dotfiles location

The dotfiles repository is cloned into `/workspaces/.codespaces/.persistedshare/dotfiles` and runs the file `install.sh`

```bash
$ # Clone & install dotfiles
Cloning into '/workspaces/.codespaces/.persistedshare/dotfiles'...
Executing script /workspaces/.codespaces/.persistedshare/dotfiles/install.sh
```

#### `install.sh`

Your dotfiles repo must have a script named `install.sh` at the top-level.

It must be added to Git as an executable file with the command

`git add --chmod=+x -- install.sh`

```bash
codespace-dotfiles main* ❯ git add --chmod=+x -- install.sh
codespace-dotfiles main* ❯ g cm "make install.sh executable"
[main d212b06] make install.sh executable
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 install.sh

codespace-dotfiles main ❯ git ls-files --stage
100644 2a5076024cf8fca833f96192a33c8a5eb9b0f8e5 0 .gitconfig
100644 ab849bc69df4104e479d4f3c40f3cdaf14a0d033 0 README.md
100755 a6e3fb981db6578fa3418467dcd709ee8466ded9 0 install.sh
# 755 means it's executable
```

## GitHub Actions

Can be defined in:

- Directly in the repository
- In an open sourced public repo
- [**GitHub Marketplace**](https://github.com/marketplace?type=actions)

### Key Concepts

- Action
- Artifact
- Event
- Job
- Runner
- Step
- Virtual Environment
- Workflow

### Actions

### Workflows

Workflows contain 1 or more actions.

Must be in the `.github/workflows` directory of a repo.

### Jobs

Task composed of **Steps**.

Can run parallel or sequentially if dependendent on a previous job.

For GitHub-hosted **runners**, each job in a **workflow** runs in a fresh instance of the runner's Virtual Environment.

### Steps

Set of tasks performed by a **job**.

Steps can run **commands** or **actions**.
