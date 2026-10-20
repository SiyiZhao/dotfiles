# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
HYPHEN_INSENSITIVE="true"
plugins=(git)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# Conda. Keep the installation optional so this file also works on machines
# where Anaconda is not installed.
if [[ -x "$HOME/opt/anaconda3/bin/conda" ]]; then
  __conda_setup="$("$HOME/opt/anaconda3/bin/conda" shell.zsh hook 2>/dev/null)"
  if [[ $? -eq 0 ]]; then
    eval "$__conda_setup"
  elif [[ -r "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/opt/anaconda3/bin:$PATH"
  fi
  unset __conda_setup
fi

# Prefer Homebrew tools to binaries provided by the base Conda environment.
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# User-installed command-line tools, including tools installed by uv.
if [[ -r "$HOME/.local/bin/env" ]]; then
  source "$HOME/.local/bin/env"
fi

# Put machine-specific settings and secrets here. This file is not managed by
# the dotfiles repository.
if [[ -r "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
