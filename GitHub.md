# GitHub

## GitHub Markdown

### Alerts

Note

> [!NOTE]
> Useful information that users should know, even when skimming content.

Tip

> [!TIP]
> Helpful advice for doing things better or more easily.

Important

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

Warning

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

Caution

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.

_source_: [GitHub docs](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#alerts)

### Images

Same as link syntax, but preceded by a `!`:

```markdown
![alt text](image_path)
```

| Context | Relative Link |
| - | - |
| In a .md file on the same branch | `/assets/images/electrocat.png` |
| In a .md file on another branch | `/../main/assets/images/electrocat.png` |
| In issues, pull requests and comments of the repository | `../blob/main/assets/images/electrocat.png?raw=true` |
| In a .md file in another repository | `/../../../../github/docs/blob/main/assets/images/electrocat.png` |
| In issues, pull requests and comments of another repository | `../../../github/docs/blob/main/assets/images/electrocat.png?raw=true` |

### Footnotes

```markdown
Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].

[^1]: My reference.
[^2]: To add line breaks within a footnote, prefix new lines with 2 spaces.
  This is a second line.
```

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

([source](https://stackoverflow.com/questions/69945775/how-to-unview-toggle-all-the-viewed-files-on-github-pull-request#comment126429925_69945864))

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

### Comparing/Diffing

2 different comparison methods - two-dot and three-dot (three-dot is the default on **GitHub** PRs)

- two-dot:  <https://github.com/USERNAME/REPOSITORY/compare/BASE..COMPARE>
- three-dot:  <https://github.com/USERNAME/REPOSITORY/compare/BASE..COMPARE>

`BASE` and `COMPARE` can be either SHAs or branch names.

example: `https://github.com/github-linguist/linguist/compare/f75c570..3391dcc`

([source](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-comparing-branches-in-pull-requests))
