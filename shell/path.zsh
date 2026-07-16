# Shared path settings

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Put Homebrew bin before conda so system git/python take priority.
export PATH="/usr/local/bin:$PATH"

# Keep user-local binaries available.
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

# Only set DYLD_LIBRARY_PATH when explicitly using conda environments.
# export DYLD_LIBRARY_PATH=/Users/siyizhao/opt/anaconda3/lib:$DYLD_LIBRARY_PATH
