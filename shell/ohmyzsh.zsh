# Shared oh-my-zsh configuration
# Only load if oh-my-zsh is installed and we're running in zsh.

autoload -Uz is-at-least

if [[ -n "${ZSH_VERSION:-}" && -d "$HOME/.oh-my-zsh" ]]; then
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="bira"
  plugins=(git)
  source "$ZSH/oh-my-zsh.sh"
fi
