#!/bin/bash

# TODO: Do the work.
# Homebrew.
if [ -x "$(command -v brew)" ]; then
  # Update Homebrew packages.
  brew update
  # Upgrade Homebrew packages.
  brew upgrade all
fi

# Composer.
if [ -x "$(command -v composer)" ]; then
  # Update Composer packages that live in ~/.composer.
  composer global update
fi
