# MSYS2

## inherit the Windows $PATH

Add `MSYS2_PATH_TYPE=inherit`

source: <https://sourceforge.net/p/msys2/discussion/general/thread/dbe17030/#3f85>

## add MSYS2 to context menu

<https://github.com/njzhangyifei/msys2-mingw-shortcut-menus>

## Configure SSH

see this procedure: <https://github.com/OULibraries/msys2-setup/blob/master/02-ssh.md>

## set `zsh` as default shell

in `\~/.bash_profile`/`~/.bashrc`, add:

```bash
# Launch Zsh
if [ -t 1 ]; then
    exec zsh
fi
```

see: <https://gist.github.com/aviaryan/5a57aa25b140f6c48f0e>

## zsh

agkozak ZSH Prompt::
only windows zsh theme that uses async git calls +
<https://github.com/agkozak/agkozak-zsh-prompt>

## mintty

### themes

<https://gist.github.com/mohnish/fbdb87bd8f5c7ecc46de519fbdd4b68c>
<https://gist.github.com/appikonda/34bf60df4253c430c4ee3254cfc0be83>
