#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

# Common functions

. "$DOTFILES_DIR/system/.function"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Bunch of symlinks

if [[ "$1" == "symlinks" ]]
then
  ln -sfv "$DOTFILES_DIR/runcom/.zshenv" ~
  ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
  ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
  ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
  ln -sfv "$DOTFILES_DIR/git/.git_commit_template" ~
  ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
fi

# Package managers & packages

if [[ "$1" == "packages" ]]
then
  . "$DOTFILES_DIR/install/brew.sh"
  . "$DOTFILES_DIR/install/npm.sh"
  . "$DOTFILES_DIR/install/pip.sh"
  . "$DOTFILES_DIR/install/brew-cask.sh"
  . "$DOTFILES_DIR/install/gems.sh"
fi
