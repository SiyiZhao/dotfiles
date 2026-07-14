# Shared path settings
export PATH="$HOME/bin:$PATH"

if [[ -d "$HOME/.local/bin" ]]; then
  case ":$PATH:" in
    *:"$HOME/.local/bin":*)
      ;;
    *)
      export PATH="$HOME/.local/bin:$PATH"
      ;;
  esac
fi
