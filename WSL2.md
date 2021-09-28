# WSL2

Windows Subsystem for Linux 2

[WSL2](#wsl2)

- [WSL2](#wsl2)
  - [Fresh installation](#fresh-installation)
    - [Upgrade [[Ubuntu]] to 21.04 (Hirsute Hippo)](#upgrade-ubuntu-to-2104-hirsute-hippo)
  - [`apt-get` hook error](#apt-get-hook-error)
    - [[[Zsh]]](#zsh)
      - [Set [[Zsh]] as default shell](#set-zsh-as-default-shell)
      - [Add completions directory](#add-completions-directory)
        - [Add dir to `$FPATH`](#add-dir-to-fpath)
    - [Install packages with apt-get](#install-packages-with-apt-get)
      - [fzf](#fzf)
      - [powerlevel10K](#powerlevel10k)
      - [[[Rust]]](#rust)
      - [Delta](#delta)
      - [lazygit](#lazygit)
      - [zsh-syntax-highlighting](#zsh-syntax-highlighting)
      - [zsh-autosuggestions](#zsh-autosuggestions)
      - [[[.NET]]](#net)
      - [Glances](#glances)
      - [GitHub CLI](#github-cli)
    - [Configure installed packages](#configure-installed-packages)
  - [Signed Git commits with [[GPG]]](#signed-git-commits-with-gpg)
  - [Configure [[Emacs]]](#configure-emacs)
  - [[[Cargo]]](#cargo)
    - [permissions error](#permissions-error)
  - [Configure [[Docker]]](#configure-docker)

## Fresh installation

### Upgrade [[Ubuntu]] to 21.04 (Hirsute Hippo)

- Run `sudo apt update && sudo apt dist-upgrade`

- Open `relase-upgrades` file: `sudo vim /etc/update-manager/release-upgrades`
  - On the last line, change `Prompt=lts` to `Prompt=normal`
- Uninstall `snapd`: `sudo apt remove snapd`
  - upgrade will fail if `snapd` is installed
    - <https://github.com/microsoft/WSL/issues/5126>
- Run upgrade: `do-release-upgrade`

## `apt-get` hook error

If, after uninstalling `snap`, you get this error:

```bash
E: Could not read response to hello message from hook [ ! -f /usr/bin/snap ] || /usr/bin/snap advise-snap --from-apt 2>/dev/null || true: Success
```

Follow the advice in <https://github.com/microsoft/WSL/issues/4640>.

To find the file with the issue:

```bash
cd /etc/apt/apt.conf.d/

grep -r snap
```

Then delete/rename the matching file to stop the hook from running.

### [[Zsh]]

#### Set [[Zsh]] as default shell

```bash
sudo apt-get install zsh

chsh -s $(which zsh)
```

#### Add completions directory

```bash
mkdir -p ~/.zsh/zsh-completions
```

##### Add dir to `$FPATH`

In `~/.zshrc`, add the line

```bash
fpath=(~/.zsh/zsh-completions $fpath)
```

### Install packages with apt-get

```bash
sudo apt-get install \
  fd-find \
  bat \
  emacs \
  exa \
  golang-go \
  jq \
  gnupg \
  neofetch \
  neovim \
  mc \
  python3-pip \
  ranger \
  postgresql \
  ripgrep \
  silversearcher-ag
```

#### fzf

_Note:_ for some reason, `fzf` won't work with `zsh-syntax-highlighting` if installed through `apt-get`

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install
```

#### powerlevel10K

```bash
mkdir ~/tools && cd ~/tools

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k &&echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

p10k configure
```

#### [[Rust]]

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### Delta

```bash
cargo install git-delta
```

#### lazygit

```bash
go get github.com/jesseduffield/lazygit
```

#### zsh-syntax-highlighting

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
```

#### zsh-autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

#### [[.NET]]

Get package

```bash
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb

rm packages-microsoft-prod.deb
```

Install

```bash
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0
```

#### Glances

```bash
pip install --user glances
```

#### GitHub CLI

```bash
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update

sudo apt install gh
```

<https://github.com/cli/cli/blob/trunk/docs/install_linux.md>

### Configure installed packages

`fd-find`

- Run:

```bash
mkdir ~/.local/bin

ln -s $(which fdfind) ~/.local/bin/fd
```

- Add `$HOME/.local/bin` to `$PATH`

## Signed Git commits with [[GPG]]

Install Gpg4win: <https://www.gpg4win.org/>

<https://www.39digits.com/signed-git-commits-on-wsl2-using-visual-studio-code>

## Configure [[Emacs]]

1. Clone my Emacs dotfiles repo
1. Run `cp -rl $DOTFILES_REPO/* ~/.emacs.d/` to symlink dotfiles to the emacs config directory

## [[Cargo]]

### permissions error

If you get errors similar to the following when running `cargo` commands:

```bash
error: could not exec the linker `cc`
  |
  = note: Permission denied (os error 13)
  = note: "cc" "-Wl,--as-needed" "-Wl,-z,noexecstack" "-m64" "-Wl,--eh-frame-hdr" "-L" "/home/bagel/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib"
```

It can be resolved by running the command

```bash
sudo apt-get install build-essential
```

_source:_ <https://github.com/rust-lang/cargo/issues/6757#issuecomment-738494343>

## Configure [[Docker]]

1. Create the docker group: `$ sudo groupadd docker`
2. Add your user to the `docker` group: `$ sudo usermod -aG docker $USER`
3. Log your user out then back in.

_source_: <https://docs.docker.com/engine/install/linux-postinstall/>
