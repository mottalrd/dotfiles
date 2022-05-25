if ! is-executable brew; then
  echo "Skipping: Homebrew-Cask (not found: brew)"
  return
fi

brew tap homebrew/cask

# Install packages

apps=(
  atom # text editor
  firefox
  google-chrome
  slack
  skyfonts # fonts manager
  trailer # pull requests
  visual-paradigm-ce # uml diagrams
  omnidisksweeper # Clean the disk, much better than Mack Disk Utility
)

brew install --cask "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
