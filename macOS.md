# macOS

- [macOS](#macos)
  - [Outlook](#outlook)
    - [group messages by conversation](#group-messages-by-conversation)
  - [\[\[rsync\]\]](#rsync)
  - [\[\[Emacs\]\]](#emacs)
    - [enable C-M-d](#enable-c-m-d)
  - [modifying config through Terminal](#modifying-config-through-terminal)
  - [\[\[vscode\]\]](#vscode)
    - [Bell sound on Ctrl+/ keybinding](#bell-sound-on-ctrl-keybinding)
  - [\[\[GPG\]\]](#gpg)
  - [Finder](#finder)
    - [Set current folder settings as default view options](#set-current-folder-settings-as-default-view-options)
    - [Keyboard Shortcuts](#keyboard-shortcuts)
    - [Add ssh keyphrase to keychain](#add-ssh-keyphrase-to-keychain)
      - [Solution](#solution)
    - [Use better versions of UNIX tools](#use-better-versions-of-unix-tools)

## Outlook

### group messages by conversation

> `View` -> `Show as Conversations`

## [[rsync]]

The version of [[rsync]] that comes with macOS is old, so it's best to download a newer version through [[homebrew]].

- `-t` preserve timestamps
- `-r` recursive sync directories

## [[Emacs]]

### enable C-M-d

run in the terminal:

```zsh
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
```

## modifying config through Terminal

```zsh
# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
```

## [[vscode]]

### Bell sound on Ctrl+/ keybinding

```bash
$ mkdir -p ~/Library/KeyBindings

$ cat > ~/Library/KeyBindings/DefaultKeyBinding.dict <<EOF
{
  "^/" = "noop";
}
EOF
```

<https://stackoverflow.com/questions/45904944/how-to-turn-off-bell-sound-in-visual-studio-code>

<https://github.com/atom/atom/issues/1669#issuecomment-135503562>

<https://github.com/microsoft/vscode/issues/44070#issuecomment-799716362>

## [[GPG]]

1. Run `brew install gnupg pinentry-mac`
2. Add `pinentry-program /usr/local/bin/pinentry-mac` to `~/.gnupg/gpg-agent.conf`
3. Restart gpg-agent by running `gpgconf --kill gpg-agent`

Links:

- <https://gist.github.com/lucko/bc2ba1f684bdce2b8cdcd8442e541e0e>
- <https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b>

## Finder

### Set current folder settings as default view options

`⌘+J` to open the settings, then click the button at the bottom labeled *Use as defaults*

### Keyboard Shortcuts

- `⌘+⌥+H`: Go to Home folder
- `⌘+<UpArrow>`: Go up one directory
- `⌘+Shift+N`: Create new folder
- `⌘+⌥+T`: Toggle toolbar
- `⌘+,`: Preferences
- `Space`: Preview selected file

### Add ssh keyphrase to keychain

This applies to:

- An issue where git commands in [[vscode]] fail because it won't recognize the [[ssh]] keyphrase
- Git on the terminal keeps asking for the ssh keyphrase

#### Solution

Run the command `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`

### Use better versions of UNIX tools

```bash
# NOTE: don't install openssh; macOS version has Keychain support
brew install coreutils \
  binutils \
  diffutils \
  ed  \
  findutils  \
  gawk \
  gnu-indent  \
  gnu-sed  \
  gnu-tar  \
  gnu-which  \
  gnutls \
  grep  \
  gzip \
  screen \
  watch \
  wdiff \
  wget \
  bash \
  emacs \
  gdb \
  gpatch \
  less \
  m4 \
  make \
  nano \
  file-formula  \
  git \
  perl \
  python \
  rsync \
  svn \
  unzip \
  vim \
  macvim \
  zsh
```

- add to `.zshrc`:

```sh
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
```

*source*: <https://www.topbug.net/blog/2013/04/14/install-and-use-gnu-command-line-tools-in-mac-os-x/>
