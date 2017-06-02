# .files

These are my dotfiles. Take anything you want, but at your own risk.
Please review the `install` folder before running

## Install

On a sparkling fresh installation of macOS:

    sudo softwareupdate -i -a
    xcode-select --install
    source ~/.dotfiles/install.sh

## Customize/extend

You can put your custom settings, such as Git credentials in the `system/.custom` file which will be sourced from `.bash_profile` automatically. This file is in `.gitignore`.

Alternatively, you can have an additional, personal dotfiles repo at `~/.extra`.

* The runcom `.bash_profile` sources all `~/.extra/runcom/*.sh` files.
* The installer (`install.sh`) will run `~/.extra/install.sh`.

## Credits

Many thanks to the [dotfiles community](https://dotfiles.github.io/).
