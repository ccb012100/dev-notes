# cron

Scheduled system jobs daemon

## view cron logs

### macOS

`log show --process cron`

### dedicated cron log file

Edit `/etc/rsyslog.d/50-default.conf` and uncomment the line that starts with `#cron.*` to have `cron` log to
`/var/log/cron.log`

### syslog

`rg CRON /var/log/syslog`

### journalctl

`journalctl -u cron.service`

## edit cron file

Either run the command `crontab -e` or place a script in an `/etc/cron.*` directory
