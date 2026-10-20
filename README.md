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
