# Deno

Runtime for JavaScript/TypeScript

## Certificate errors

### Symptom

When trying to upgrade Deno, using proxy servers with MITM certificates can cause the following error:

```bash
$ deno upgrade
Looking up latest version
error: error sending request for url (https://dl.deno.land/release-latest.txt): error trying to connect: invalid peer certificate: UnknownIssuer

Caused by:
    0: error trying to connect: invalid peer certificate: UnknownIssuer
    1: invalid peer certificate: UnknownIssuer
```

### Solution

Set the `$DENO_TLS_CA_STORE` variable

#### PowerShell

Run as Administator:

```pwsh
$Env:DENO_TLS_CA_STORE='system'; deno upgrade
```

#### Linux

```bash
DENO_TLS_CA_STORE=system deno upgrade
```
