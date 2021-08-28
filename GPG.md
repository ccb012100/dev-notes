# GPG

## debug

echo "test" | gpg --clearsign

## changing password timeout

`~/.gnupg/gpg-agent.conf` contains values (in seconds) to set `cachettl`

## list secret keys

`gpg --list-secret-keys --keyid-format=long`
