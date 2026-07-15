# Shared Python environment bootstrap for zsh
#
# Keep this file focused on Python tooling that should be shared across machines.
# Update the paths below if your local installs move.

# Conda: prefer the shell hook when available, fall back to conda.sh, then PATH.
if [[ -n "${CONDA_EXE:-}" ]]; then
  __conda_setup="$(${CONDA_EXE} shell.zsh hook 2>/dev/null)"
  if [[ $? -eq 0 ]]; then
    eval "$__conda_setup"
  elif [[ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]]; then
    . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
  elif [[ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]]; then
    . "$HOME/anaconda3/etc/profile.d/conda.sh"
  elif [[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  fi
  unset __conda_setup
fi

# uv: add common shims / executables when present.
if [[ -d "$HOME/.local/bin" ]]; then
  case ":$PATH:" in
    *:"$HOME/.local/bin":*)
      ;;
    *)
      export PATH="$HOME/.local/bin:$PATH"
      ;;
  esac
fi
