# snap

CLI tool for working with snap packages

## Upgrade packages

```bash
sudo snap refresh
```

## Upgrading snap-store

The `snap-store` service has to be stopped before upgrading

```bash
pkill snap-store
sudo snap refresh snap-store
```
