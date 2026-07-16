#!/usr/bin/env bash
set -euo pipefail

backup_if_exists() {
  local target="$1"
  local backup_root="$2"

  if [[ ! -e "${target}" && ! -L "${target}" ]]; then
    return 0
  fi

  mkdir -p "${backup_root}"

  local stamp
  stamp="$(date +%Y%m%d_%H%M%S)"
  local base
  base="$(basename "${target}")"
  local backup_path="${backup_root}/${base}.${stamp}"

  mv "${target}" "${backup_path}"
  echo "Backed up: ${target} -> ${backup_path}"
}
