# Zscaler

Internet proxy software

## `NODE_EXTRA_CA_CERTS`

Set `NODE_EXTRA_CA_CERTS` in your Windows system environment variables to point to the **Zscaler** root certificate. This will affect all instances of **Nodejs**.

## VS Code

### WSL

To resolve the error:

> unable to get local issuer certificate

when trying to install **vscode** extensions in **WSL**, set the WSL environment variables with the [`server-env-setup`](https://code.visualstudio.com/docs/remote/wsl#_advanced-environment-setup-script) file.

1. On the WSL filesystem, create the file `$HOME/.vscode-server/server-env-setup` (the file must be a valid Bash script).
2. Set `NODE_EXTRA_CA_CERTS` to point to the **Zscaler** root certificate that you registered in the Windows certificate store:

    ```bash
    # !/usr/bin/env bash
    export NODE_EXTRA_CA_CERTS="/mnt/c/Users/chris/zscaler_root_cert.pem"
    ```

## DBeaver

### **macOS**[^1]

1. [Install](https://www.java.com/en/download/) the **Java Runtime Environment** (a.k.a. the **JRE**)
1. Run the command:

    ```bash
    keytool -import -file PATH_TO_ZSCALER_ROOT_CERT -keystore /Applications/DBeaver.app/Contents/Eclipse/jre/Contents/Home/lib/security/cacerts
    ```

1. When prompted for a password, enter `changeit`

[^1]: ([source](https://github.com/dbeaver/dbeaver/issues/4341#issuecomment-2284337267))
