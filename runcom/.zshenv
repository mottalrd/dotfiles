# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# OS

if [ "$(uname -s)" = "Darwin" ]; then
  OS="macOS"
else
  OS=$(uname -s)
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Read cache

DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
[ -f "$DOTFILES_CACHE" ] && . "$DOTFILES_CACHE"

# Finally we can source the dotfiles (order matters)

for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,completion,grep,prompt,nvm,gems,private,fzf}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "macOS" ]; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.macos; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
  done
fi

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export

export OS DOTFILES_DIR

# Pyenv conf

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
  eval "$(pyenv virtualenv-init -)"
fi

# https://coderwall.com/p/w7fnxa/using-rbenv-ruby-from-within-vim-zsh
# Comment out path_helper in /etc/zprofile to make rbenv work nvim
eval "$(rbenv init - zsh)"
