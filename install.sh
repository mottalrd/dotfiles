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
  ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
  ln -sfv "$DOTFILES_DIR/runcom/.zprofile" ~
  ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
  ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
  ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
  ln -sfv "$DOTFILES_DIR/git/.git_commit_template" ~
  ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
  ln -sfv "$DOTFILES_DIR/nvim/init.lua" ~/.config/nvim/
fi

if [[ "$1" == "ohmyzsh" ]]
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Package managers & packages

if [[ "$1" == "brew" ]]
then
  . "$DOTFILES_DIR/install/brew.sh"
fi

if [[ "$1" == "cask" ]]
then
. "$DOTFILES_DIR/install/brew-cask.sh"
fi

if [[ "$1" == "npm" ]]
then
  . "$DOTFILES_DIR/install/npm.sh"
fi

if [[ "$1" == "pip" ]]
then
. "$DOTFILES_DIR/install/pip.sh"
fi

if [[ "$1" == "gems" ]]
then
. "$DOTFILES_DIR/install/gems.sh"
fi
