#!/usr/bin/env bash

# iTerm2 app settings. Quit and reopen iTerm2 after you run this.

# Menu shortcuts. The keys must match the menu titles exactly.
# "^" = Ctrl, "@" = Cmd, "~" = Option, "$" = Shift.
# Ctrl+L replaces zsh clear-screen. Ctrl+K replaces zsh kill-line.
defaults write com.googlecode.iterm2 NSUserKeyEquivalents -dict-add \
  "Move Tab to New Window" "^l" \
  "Merge All Windows" "^k"
