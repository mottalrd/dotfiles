if ! is-executable brew; then
  echo "Skipping: Homebrew-Cask (not found: brew)"
  return
fi

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  atom # text editor
  kaleidoscope # diff tool
  dropbox
  firefox
  google-chrome
  google-drive
  macdown # markdown editor
  slack
  transmit # file transfer
  skyfonts # fonts manager
  skype
  trailer # pull requests
  anki # flashcards
  visual-paradigm-ce # uml diagrams
  postman # api testing
  dbeaver-community # SQL editor
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
