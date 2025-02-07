if ! is-executable brew; then
  echo "Skipping: Homebrew-Cask (not found: brew)"
  return
fi

brew tap homebrew/cask

# Install packages

apps=(
  visual-studio-code
  firefox
  google-chrome
  slack
  skyfonts # fonts manager
  visual-paradigm-ce # uml diagrams (alternative ilograph.com)
  omnidisksweeper # Clean the disk, much better than Mack Disk Utility
  espanso # Text expander
)

brew install --cask "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
