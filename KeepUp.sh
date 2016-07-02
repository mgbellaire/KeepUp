#!/bin/bash

# TODO: Do the work.
if [ -x "$(command -v brew)" ]; then
  # Update Homebrew packages.
  brew update
  # Upgrade Homebrew packages.
  brew upgrade all
fi

if [ -x "$(command -v composer)" ]; then
  # Update Composer packages that live in ~/.composer.
  composer global update
fi
