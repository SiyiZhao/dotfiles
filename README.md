# dotfiles

Personal configuration files and environment setup.

## Zsh

The tracked Zsh configuration lives at `zsh/.zshrc`. Link it into the home
directory so changes made in this repository take effect in new interactive
shells:

```sh
ln -s "$PWD/zsh/.zshrc" "$HOME/.zshrc"
```

Machine-specific settings and secrets belong in `~/.zshrc.local`, which is
loaded automatically when present and is not stored in this repository.

## Git

Portable Git configuration lives at `git/.gitconfig`, and global ignore rules
live at `git/ignore`. Link both files into their standard locations:

```sh
ln -s "$PWD/git/.gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.config/git"
ln -s "$PWD/git/ignore" "$HOME/.config/git/ignore"
```

Machine-specific settings and secrets belong in `~/.gitconfig.local`, which is
included after the portable configuration and is not stored in this repository.
The include does not create that file. On a new machine, replace the example
values and create it with:

```sh
(
  umask 077
  git config --file "$HOME/.gitconfig.local" user.name "Your Name"
  git config --file "$HOME/.gitconfig.local" user.email "you@example.com"
)
```

Use `--file` for these personal values: `git config --global` writes to the
linked `~/.gitconfig` in this setup, which is tracked in dotfiles.

Do not set `core.excludesFile` unless intentionally replacing the linked
`~/.config/git/ignore`; Git uses that XDG path by default.
