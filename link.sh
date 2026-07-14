#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_ROOT="${HOME}/.dotfiles_backup"

source "${REPO_ROOT}/scripts/backup.sh"

link_file() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "${dst}")"

  if [[ -L "${dst}" ]]; then
    local current_target
    current_target="$(readlink "${dst}")"
    if [[ "${current_target}" == "${src}" ]]; then
      echo "Already linked: ${dst} -> ${src}"
      return 0
    fi
  fi

  backup_if_exists "${dst}" "${BACKUP_ROOT}"
  ln -sfn "${src}" "${dst}"
  echo "Linked: ${dst} -> ${src}"
}

link_file "${REPO_ROOT}/shell/zshrc" "${HOME}/.zshrc"
link_file "${REPO_ROOT}/git/gitconfig" "${HOME}/.gitconfig"
link_file "${REPO_ROOT}/git/gitignore_global" "${HOME}/.gitignore_global"
link_file "${REPO_ROOT}/tmux/tmux.conf" "${HOME}/.tmux.conf"
