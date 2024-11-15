# Zscaler

Internet proxy software

## Nodejs

Set `NODE_EXTRA_CA_CERTS` in your Windows system environment variables to point to the **Zscaler** root certificate. This will affect all instances of **Nodejs**.

## DBeaver

### **macOS**[^1]

1. [Install](https://www.java.com/en/download/) the **Java Runtime Environment** (a.k.a. the **JRE**)
1. Run the command:

    ```bash
    keytool -import -file PATH_TO_ZSCALER_ROOT_CERT -keystore /Applications/DBeaver.app/Contents/Eclipse/jre/Contents/Home/lib/security/cacerts
    ```

1. When prompted for a password, enter `changeit`

[^1]: ([source](https://github.com/dbeaver/dbeaver/issues/4341#issuecomment-2284337267))

## WSL

### Google Chrome

download certificate from Chrome/Edge and run:

```bash
sudo cp /mnt/C/Users/<User>/Downloads/zscaler_root_ca.crt /usr/local/share/ca-certificates/zscaler_root_ca.crt
sudo update-ca-certificates
```

### VS Code

To resolve the error:

> unable to get local issuer certificate

when trying to install **vscode** extensions in **WSL**, set the WSL environment variables with the [`server-env-setup`](https://code.visualstudio.com/docs/remote/wsl#_advanced-environment-setup-script) file.

1. On the WSL filesystem, create the file `$HOME/.vscode-server/server-env-setup` (the file must be a valid Bash script).
2. Set `NODE_EXTRA_CA_CERTS` to point to the **Zscaler** root certificate that you registered in the Windows certificate store:

    ```bash
    # !/usr/bin/env bash
    export NODE_EXTRA_CA_CERTS="/mnt/c/Users/chris/zscaler_root_cert.pem"
    ```