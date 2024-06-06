# NVM

[Node Version Manager](https://github.com/nvm-sh/nvm)

## Version aliases

- `node`
  - latest version
- `lts/*`
  - latest LTS version
- `system`
  - system-installed version of node

## Usage

```bash
# install latest version
nvm install node

# install specific version
nvm install 14.7.0

# install latest LTS version

# list available versions
nvm ls-remote

# use installed version
nvm use node

# run node
nvm run node --version

# run a command, in a subshell, with a specific version of node
nvm exec 4.2 node --version

# get patch to installed location of specific version
nvm which 12.22
```

_source_: <https://github.com/nvm-sh/nvm?tab=readme-ov-file#usage>

## Update NPM

```bash
nvm install --latest-npm
```
