# [[Ubuntu]] [[Linux]]

## get version

```bash
lsb_release -a
```

## Debian package (`.deb` file)

### Install

```cmd
sudo dpkg -i package_file.deb
```

### Uninstall

```cmd
sudo dpkg -i package_file.deb
```

## Advanced Package Tool (APT)

```bash
# "apt" or "apt-get"

apt update

apt install $PACKAGE_NAME

apt search $PACKAGE_NAME

apt update

apt upgrade
```
