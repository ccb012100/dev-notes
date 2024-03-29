# Zscaler

Internet proxy software

## `NODE_EXTRA_CA_CERTS`

Set `NODE_EXTRA_CA_CERTS` in your [[Windows]] system environment variables to point to the **Zscaler** root certificate. This will affect all instances of [[Nodejs]].

## Certificate issues with [[vscode]] in [[WSL]]

### Problem

When trying to install **vscode** extensions in **WSL**, it fails with the error:

> unable to get local issuer certificate

### Solution

This is solved by setting the [[WSL]] environment variables with the [`server-env-setup`](https://code.visualstudio.com/docs/remote/wsl#_advanced-environment-setup-script) file.

- On the WSL filesystem, create the file `$HOME/.vscode-server/server-env-setup`.
  - The file must be a valid [[Bash]] script.
- Set `NODE_EXTRA_CA_CERTS` to point to the **Zscaler** root certificate that you registered in the [[Windows]] certificate store:

  ```bash
  # !/usr/bin/env bash
  export NODE_EXTRA_CA_CERTS="/mnt/c/Users/chris/zscaler_root_cert.pem"
  ```
