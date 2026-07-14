#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$("${REPO_ROOT}/scripts/detect_os.sh")"

"${REPO_ROOT}/link.sh"

if [[ "${OS}" == "macos" ]]; then
  "${REPO_ROOT}/macos/defaults.sh"
else
  echo "Skipping macOS defaults for OS=${OS}"
fi
