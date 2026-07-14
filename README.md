# dotfiles

Personal dotfiles scaffold with **macOS as the primary workstation target** and reserved space for future Linux / supercomputer setups.

This repository starts with a **symlink-first, incremental migration** model so you can adopt one config at a time without breaking your current environment.

## Structure

```text
README.md
bootstrap.sh
install.sh
link.sh
shell/
  zshrc
  aliases.zsh
  exports.zsh
  path.zsh
  local.zsh.example
git/
  gitconfig
  gitignore_global
tmux/
  tmux.conf
macos/
  defaults.sh
  aerospace/aerospace.toml
  sketchybar/sketchybarrc
linux/
  bashrc
cluster/
  README.md
machines/
  macos/README.md
  cluster/README.md
scripts/
  backup.sh
  detect_os.sh
```

## First-time setup

```bash
cd ~/dotfiles
chmod +x bootstrap.sh install.sh link.sh scripts/*.sh macos/defaults.sh
./bootstrap.sh
```

`bootstrap.sh` is the main entry point. It currently runs safe local setup and symlink deployment.

## Incremental migration (safe path)

1. **Back up existing files first** (automatic in `link.sh` too):
   - `~/.zshrc`
   - `~/.gitconfig`
   - `~/.tmux.conf`
2. Run `./link.sh`.
3. Verify terminal, git, and tmux behavior.
4. Move custom content from backups into managed files gradually:
   - Start with `shell/zshrc`
   - Then `git/gitconfig`
   - Then `tmux/tmux.conf`
5. Keep machine-specific or secret settings in local overrides (not committed).

## Local overrides (do not commit secrets)

Use these example files as templates:

- `shell/local.zsh.example` -> copy to `~/.zshrc.local`
- create `~/.gitconfig.local` for personal machine identity/secrets
- create `~/.tmux.local.conf` for machine-specific tmux settings

The managed configs already include these local files when present.

## Shell choice note: macOS zsh vs Linux bash

- macOS defaults to **zsh** in modern versions, so this scaffold treats zsh as the primary shell on macOS.
- Linux and many clusters commonly initialize **bash** via `~/.bashrc`.
- This repo does **not** force one shell everywhere yet:
  - `shell/` contains shared zsh-focused config for macOS now.
  - `linux/bashrc` is reserved for Linux/cluster shell startup behavior.

## Current workflow scripts

- `bootstrap.sh`: main entrypoint for a new machine.
- `install.sh`: OS-aware install flow.
- `link.sh`: symlink deployment with automatic backup of existing files.
- `scripts/backup.sh`: backup helper used by `link.sh`.
- `scripts/detect_os.sh`: simple OS detection (`macos`, `linux`, or `unknown`).

## Extending later

- Fill `macos/defaults.sh` with macOS defaults commands when ready.
- Add Linux and cluster-specific links in `link.sh` once those paths are finalized.
- Keep shared, non-secret defaults in this repo and isolate sensitive values in local files.
