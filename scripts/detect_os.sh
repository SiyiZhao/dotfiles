#!/usr/bin/env bash
set -euo pipefail

case "$(uname -s)" in
  Darwin)
    echo "macos"
    ;;
  Linux)
    echo "linux"
    ;;
  *)
    echo "unknown"
    ;;
esac
