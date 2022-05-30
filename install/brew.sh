if ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (not found: ruby, curl and/or git)"
  return
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if ! is-executable brew; then
  echo "Skipping: Homebrew packages (not found: brew)"
  return
fi

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  coreutils
  ffmpeg
  fasd
  gifsicle
  git
  git-extras
  gnu-sed
  grep
  hub
  httpie
  imagemagick
  jq
  peco
  psgrep
  python
  shellcheck
  ssh-copy-id
  tree
  wget
  wifi-password
  jenv
  libxml2
  neovim
  fzf
  diff-so-fancy
  bat
  findutils
  tldr
  pyenv
  languagetool
  # git-fuzzy https://github.com/bigH/git-fuzzy/issues/3
  nvm
  iterm2
  postgresql
  redis
  yarn
  timing
  heroku
)

brew install "${apps[@]}"

export BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "BREW_PREFIX_COREUTILS" "$BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"
