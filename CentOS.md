# [[CentOS]]

## services

`systemctl`

`$ sudo systemctl start application.service`

`$ sudo systemctl start application`

`$ sudo systemctl stop application.service`

`$ sudo systemctl reload-or-restart application.service`

`$ systemctl status application.service`

`$ systemctl is-active application.service`

`$ systemctl is-failed application.service`

## package management

`yum`

`$ yum help`

`$ yum list [available|installed|all|kernel]`

`$ yum info package-name`

`$ yum search package-name`

`$ yum update`

`$ yum yum update package-name`

`$ yum reinstall package-name`

`$ yum [remove|erase] package-name`

`$ yum autoremove package-name`

`$ yum show-installed`

`$ yum history`

`$ yum clean`
