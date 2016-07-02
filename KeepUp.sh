#!/bin/bash

# TODO: Do the work.
# TODO: Wrap this in check for "brew" command.
# Update homebrew packages.
brew update
# Upgrade homebrew packages.
brew upgrade all

if [ -x "$(command -v composer)" ]; then
# TODO: Update composer packagrs
fi