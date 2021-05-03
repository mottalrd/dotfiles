#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"
EXTRA_DIR="$HOME/.extra"

# Common functions

. "$DOTFILES_DIR/system/.function"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.git_commit_template" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/pip.sh"

if [ "$(uname)" == "Darwin" ]; then
  . "$DOTFILES_DIR/install/brew-cask.sh"
  . "$DOTFILES_DIR/install/gems.sh"
fi

# Run tests

if is-executable bats; then bats test/*.bats; else echo "Skipped: tests (missing: bats)"; fi

# Install extra stuff

if [ -d "$EXTRA_DIR" -a -f "$EXTRA_DIR/install.sh" ]; then
  . "$EXTRA_DIR/install.sh"
fi
