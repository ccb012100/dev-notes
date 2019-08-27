# Emacs

# package-install

`M-x package-refresh-contents`

## package list

`M-x list-packages`

`i`

- Mark the package on the current line for installation (package-menu-mark-install). If the package status is ‘available’, this adds an ‘I’ character to the start of the line; typing x (see below) will download and install the package.

`d`

- Mark the package on the current line for deletion (package-menu-mark-delete). If the package status is ‘installed’, this adds a ‘D’ character to the start of the line; typing x (see below) will delete the package.

`u` or `<DEL>`

- Remove any installation or deletion mark previously added to the current line by an i or d command. 

`U`

- Mark all package with a newer available version for upgrading (package-menu-mark-upgrades). This places an installation mark on the new available versions, and a deletion mark on the old installed versions.

`x`

- Download and install all packages marked with i, and their dependencies; also, delete all packages marked with d (package-menu-execute). This also removes the marks. 

`r`

- Refresh the package list (package-menu-refresh). This fetches the list of available packages from the package archive again, and recomputes the package list.

`f`

- Filter the package list (package-menu-filter). This prompts for a keyword (e.g., ‘games’), then shows only the packages that relate to that keyword. To restore the full package list, type q.
