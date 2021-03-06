if ! is-executable brew; then
  echo "Skipping: Homebrew-Cask (not found: brew)"
  return
fi

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  atom
  kaleidoscope
  dropbox
  firefox
  google-chrome
  google-drive
  macdown
  opera
  slack
  sourcetree
  transmit
  virtualbox
  rubymine
  pycharm
  java
  psequel
  skyfonts
  caffeine
  skype
  trailer
  anki
  dash
  visual-paradigm-ce
  postman
  keyboard-maestro
  clipy
  hammerspoon
  kabiner-elements
  dbeaver-community
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
