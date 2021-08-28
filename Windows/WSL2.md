# WSL2

[WSL2](#wsl2)

- [WSL2](#wsl2)
  - [Fresh installation](#fresh-installation)
    - [Upgrade Ubuntu to 21.04 (Hirsute Hippo)](#upgrade-ubuntu-to-2104-hirsute-hippo)
    - [Set `zsh` as default shell](#set-zsh-as-default-shell)
    - [Install packages](#install-packages)
      - [powerlevel10K](#powerlevel10k)
      - [Rust](#rust)
    - [Delta](#delta)
      - [lazygit](#lazygit)
      - [zsh-syntax-highlighting](#zsh-syntax-highlighting)
      - [zsh-autosuggestions](#zsh-autosuggestions)
      - [.NET](#net)
    - [Configure installed packages](#configure-installed-packages)
  - [Signed Git commits with GPG](#signed-git-commits-with-gpg)
  - [Cargo](#cargo)
    - [permissions error](#permissions-error)
  - [_source:_ <https://github.com/rust-lang/cargo/issues/6757#issuecomment-738494343>](#source-httpsgithubcomrust-langcargoissues6757issuecomment-738494343)

## Fresh installation

### Upgrade Ubuntu to 21.04 (Hirsute Hippo)

- Run `sudo apt update && sudo apt dist-upgrade`

- Open `relase-upgrades` file: `sudo vim /etc/update-manager/release-upgrades`
  - On the last line, change `Prompt=lts` to `Prompt=normal`
- Uninstall `snapd`: `sudo apt remove snapd`

  - upgrade will fail if `snapd` is installed
    - <https://github.com/microsoft/WSL/issues/5126>

- Run upgrade: `do-release-upgrade`

### Set `zsh` as default shell

- `sudo apt install zsh`
- `chsh -s $(which zsh)`

### Install packages

- `sudo apt install fd-find bat emacs exa golang-go jq neovim fzf gnupg neofetch mc ranger postgresql ripgrep silversearcher-ag`

#### powerlevel10K

- `mkdir ~/tools && cd ~/tools`
- git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k &&echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc`
- `p10k configure`

#### Rust

`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

### Delta

`cargo install git-delta`

#### lazygit

`go get github.com/jesseduffield/lazygit`

#### zsh-syntax-highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`

#### zsh-autosuggestions

`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

#### .NET

```bash
$ wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
$ sudo dpkg -i packages-microsoft-prod.deb
$ rm packages-microsoft-prod.deb
```

### Configure installed packages

`fd-find`

- `mkdir ~/.local/bin`
- `ln -s $(which fdfind) ~/.local/bin/fd`
- Add `$HOME/.local/bin` to `$PATH`

## Signed Git commits with GPG

Install Gpg4win: <https://www.gpg4win.org/>

<https://www.39digits.com/signed-git-commits-on-wsl2-using-visual-studio-code>

## Cargo

### permissions error

If you get errors similar to the following when running `cargo` commands:

```bash
error: could not exec the linker `cc`
  |
  = note: Permission denied (os error 13)
  = note: "cc" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-m64" "-Wl,--eh-frame-hdr" "-L" "/home/bagel/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib"
```

It can be resolved by running the command `sudo apt install build-essential`

## _source:_ <https://github.com/rust-lang/cargo/issues/6757#issuecomment-738494343>
